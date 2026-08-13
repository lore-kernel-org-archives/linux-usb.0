Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AB848AE0F;
	Thu, 13 Aug 2026 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635242; cv=none; b=FpelGH5KRlwi+4o0r2L6diCwrCVheWZWmlT7wF1Ufc4SO47gbHnRYHOp1uTU5l5SrWCt0rL7WNp1p2/cuua2NK7Lq8itJ0qF265NFKNT8KrMm/2Nlh50Heb3Qg/b292dX/t0Gnx8slNZ39n9JVXA+WREgACFCz1fJkOLuEiPz3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635242; c=relaxed/simple;
	bh=C9dVE97QX7R2h0xqYmSfNdYsahc8ZF0BspXO3OXAe+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=txniG7PhTTxoEr4cnYEMJLDb+HMvaDq7buuZPekD3dd6hVtxxg81f1QW5QBA6BU+/e3xcUkjBdtnCpFlM7mMQWHDMDw5H+Xs6Ah1T/q4yCFPcOcGPY0U/lGqpP1rJBlCyWLeQyNCGmZGIqPFjrgvVzZ7T/IdwMzGr6ZILowm73g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowADHn_Ph431qDfN5BQ--.53587S2;
	Thu, 13 Aug 2026 23:33:54 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3 2/2] usb: musb: da8xx: depopulate OF children on remove
Date: Thu, 13 Aug 2026 23:33:53 +0800
Message-ID: <20260813153353.42817-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260813153021.38834-1-pengpeng@iscas.ac.cn>
References: <20260813153021.38834-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADHn_Ph431qDfN5BQ--.53587S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4rZF48Cw4DZF1fWF45Wrg_yoWktFc_GF
	95uF4kGw1kCF1vkr45KrWfuFWIya1DXrZ7XF1DKrsIqa4UZr1fX34UArsrGFy7ZFsrCrnx
	J3sF9w4a9a4fujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU089NUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

da8xx_probe() creates CPPI platform devices with of_platform_populate(),
but da8xx_remove() unregisters only the separately created MUSB device and
the generic PHY. The OF children therefore remain registered after the
glue driver is unbound.

Pair the successful population with of_platform_depopulate() during remove.
Unregister the MUSB device first because it reuses the parent DT node but
was not created by of_platform_populate().

Fixes: d6299b6efbf6 ("usb: musb: Add support of CPPI 4.1 DMA controller to DA8xx")

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/musb/da8xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index c08ec1241dc0..6c859a1a11d0 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -593,6 +593,7 @@ static void da8xx_remove(struct platform_device *pdev)
 	struct da8xx_glue		*glue = platform_get_drvdata(pdev);
 
 	platform_device_unregister(glue->musb);
+	of_platform_depopulate(&pdev->dev);
 	usb_phy_generic_unregister(glue->usb_phy);
 }
 
-- 
2.50.1 (Apple Git-155)

