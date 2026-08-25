Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8101949365A;
	Tue, 25 Aug 2026 04:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787633771; cv=none; b=j6+dSg+D6AOSBayFNODxJHlC9pn7X9MjfE0aEw5DdkoyMScuOjKTzctYAPZGMJ6IfR9/fc+36jGE6ELHHbpc1ZzH7pDVHuevMBLSDCulAESEjXD02sWAPcH5+fxfF4FRFfBRQRZ7uuGZpppX3qUsUnR0NYjk0jSwd6FkQ6CPO4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787633771; c=relaxed/simple;
	bh=bOiKqTbNqhKOzwGIa2mnMr3nUQjsJF8X0XooeIvVpLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VpU15/XD8wL7ePHLPvymnE4MTgI/7OXoNprEq/x83S60Mjluwo5b1gbEWZppxCZrC6r6W36GYstQh906gYzXxW6oXkvXaMU+wdNaYLAJ/D5R0uvpxIPud9A2BgWX/p3oGK8KeOpDEh+h2v+uQHgGqV6tMNqkBYIM6Uy6dweIEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S.localdomain (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAB3Su5dII1qGUx9Bg--.42058S2;
	Tue, 25 Aug 2026 12:55:57 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: westeri@kernel.org,
	andreas.noever@gmail.com,
	YehezkelShB@gmail.com,
	isaac.hazan@intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] thunderbolt: dma_test: Tear down DMA paths before stopping the rings
Date: Tue, 25 Aug 2026 11:47:59 +0800
Message-ID: <20260825034759.5403-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAB3Su5dII1qGUx9Bg--.42058S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4kWF1xKF43ZF4kur4fGrg_yoW8CF48pF
	WY9Fyjyr4xZa4xAFyDGF18ZF15ArsxAFZ7CryrK3yS9r15KayIqFWkKrW0qrn7GrW8Xws2
	vF4IvrWfWw1UXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUvXd8UUU
	UU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEKA2qM4MUiigABsu

dma_test_stop_rings() stops the RX and TX rings before calling
tb_xdomain_disable_paths().  tb_ring_stop() zeroes the ring's descriptor
base and the cancellation callbacks unmap and free the frame buffers, so
by the time __tb_path_deactivate_hop() polls the hop's 'pending' bit any
data still in flight has nowhere to drain to; on ASMedia ASM4242-class
host routers the bit never clears and every teardown burns the full
500 ms timeout.  This is the same defect as the one in tbnet_tear_down(),
fixed as CVE-2026-74691 ("net: thunderbolt: Tear down DMA paths before
stopping the rings").

Move the tb_xdomain_disable_paths() call before the tb_ring_stop() calls
in dma_test_stop_rings(), so in-flight data drains while the rings are
still active, and only then stop the rings and free the frame buffers.

Fixes: edc0f494ed966 ("thunderbolt: Add DMA traffic test driver")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/thunderbolt/dma_test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index 7877319b1b03..4acce31f1397 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -215,11 +215,6 @@ static void dma_test_stop_rings(struct dma_test *dt)
 {
 	int ret;
 
-	if (dt->rx_ring)
-		tb_ring_stop(dt->rx_ring);
-	if (dt->tx_ring)
-		tb_ring_stop(dt->tx_ring);
-
 	ret = tb_xdomain_disable_paths(dt->xd, dt->tx_hopid,
 				       dt->tx_ring ? dt->tx_ring->hop : -1,
 				       dt->rx_hopid,
@@ -227,6 +222,11 @@ static void dma_test_stop_rings(struct dma_test *dt)
 	if (ret)
 		dev_warn(&dt->svc->dev, "failed to disable DMA paths\n");
 
+	if (dt->rx_ring)
+		tb_ring_stop(dt->rx_ring);
+	if (dt->tx_ring)
+		tb_ring_stop(dt->tx_ring);
+
 	dma_test_free_rings(dt);
 }
 
-- 
2.25.1

