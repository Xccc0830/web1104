<?php
session_start();
include("db.php");

if (!isset($_SESSION['user']['role']) || $_SESSION['user']['role'] !== 'M') {
    die("❌ 權限不足，只有管理員可以修改職缺。");
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $id = intval($_POST['id']);
    $company = $_POST['company'] ?? '';
    $content = $_POST['content'] ?? '';
    $pdate = $_POST['pdate'] ?? '';

    $stmt = $conn->prepare("UPDATE job SET company=?, content=?, pdate=? WHERE postid=?");
    $stmt->bind_param("sssi", $company, $content, $pdate, $id);

    if ($stmt->execute()) {
        echo "<p class='text-success'>職缺更新成功！</p>";
        header("Location: job.php");
        exit;
    } else {
        echo "<p class='text-danger'>❌ 更新失敗：" . $stmt->error . "</p>";
    }

    $stmt->close();
}
$conn->close();
?>
