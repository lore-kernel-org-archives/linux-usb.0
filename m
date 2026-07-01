Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868B325B08A;
	Wed,  1 Jul 2026 05:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884149; cv=none; b=eg2CyBFfzLgXoVv1+uFJGZeRb3pCMy48hVl4dATdeNu6iknN8RHQZsOFV37KUHao0T2o3PPkF4ICrO7yZHaYoJ+USNeBgazPEn5h/O9sdT1VmNnrjJtYjA9N0wOGbBOtdBaVb5R6lSsdo/hBF+yX10Z6db+MHBFs5O7gjf/bOto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884149; c=relaxed/simple;
	bh=cwoQev4sSJQHJ/tU/Iu8EduVsCkBt6RsbGucN5YwIVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=htkfbB7dpBdrgXSKLTUpUwlkL9M9FfAIGE9R602xRNjPsVsDY1esjRwcZNsa8fj5HKLkBnhBq39/BzIHnnsot6rtTgRa5WErOGVDeKq4rKAgD6eKmgA4r4xofbh9wMVEyB5pcyoStYIg8TK/enCp8fNXOXmv7p2AtD8RabFPZkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowACnuM8up0RqEsyHFg--.52057S2;
	Wed, 01 Jul 2026 13:35:42 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: io_ti: reject oversized boot-mode firmware images
Date: Wed,  1 Jul 2026 13:35:35 +0800
Message-ID: <20260701053535.39951-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACnuM8up0RqEsyHFg--.52057S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw47Wr4fWFWDtFyrJr47Arb_yoWkKwc_C3
	s5uF1kt348CFWYyr17Cr9IvrZak3yUuF10gF409a9rJr98XFs3Xr1UXrs5Zr17Ja1jyr1D
	ur45J3yxCw4DCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbb_-PUUUU
	U==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

do_boot_mode() allocates a fixed 15.5 KiB staging buffer plus the I2C
image header and then copies fw->size - 4 bytes into it.
check_fw_sanity() validates the firmware's internal record accounting,
but the boot-mode copy still needs to prove that the raw firmware
payload fits in the fixed staging buffer.

Reject firmware images that are shorter than the skipped 4-byte prefix
or whose remaining payload exceeds the staging buffer before copying the
data.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/serial/io_ti.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index d48819d7..3bdcbd6f 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -1466,6 +1466,12 @@ static int do_boot_mode(struct edgeport_serial *serial,
 		/* Allocate a 15.5k buffer + 3 byte header */
 		buffer_size = (((1024 * 16) - 512) +
 					sizeof(struct ti_i2c_image_header));
+		if (fw->size < 4 || fw->size - 4 > buffer_size) {
+			dev_err(dev, "%s - firmware image is too large\n",
+				__func__);
+			return -EINVAL;
+		}
+
 		buffer = kmalloc(buffer_size, GFP_KERNEL);
 		if (!buffer)
 			return -ENOMEM;

