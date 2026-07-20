Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8326E4048BB;
	Mon, 20 Jul 2026 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548105; cv=none; b=YWW5gHHFc4QWNB7h2sdEhKyzYlr7ABYd5yhGl6qoGQpCcw6g6PM8iQ3D34v0DXODKNMe/GEwW8gdxjY4uv6RSoOCaKvICsDCw2WZY1hnHbSJ97n2KCOhb8zDyF/ixyUO7cKue5YqvC2ifFzO4B7x4o/p+gZqbNg4G603JAyJbdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548105; c=relaxed/simple;
	bh=7Y8QkdmHKYOnAfX1CWKH4TnmIcBzbHvt1FItYl6psJs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PaX5QP/2xIrb4CTb8aK80+n0aWECjxAhyQN6YCHzIW/axP0qWqF2AzW+U3JkV4+tog8IHsO1e2OcrwCpxon2smGVJT8y+5cKJeFNpNIoqBgB59UneBFFwfc7assWOgj6LEjdbPqsSPuo7tIytLkC8y+XaDrJtbliFdBv+XIe+3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABn1T8BC15q1bOIAA--.63197S2;
	Mon, 20 Jul 2026 19:48:18 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] USB: serial: io_ti: reject oversized boot-mode firmware
Date: Mon, 20 Jul 2026 19:48:17 +0800
Message-ID: <20260720114817.65531-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABn1T8BC15q1bOIAA--.63197S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFykZw13JF4UXw43JryUAwb_yoW8XF1UpF
	sYgFW7Krn8XF4xXFySyF1SvFyru3ZYqFW3KFZxX3yF9rn0vrn29FyrGrW0gFy7Ar1fGr1q
	yFWjvr4DCF48taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
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

do_boot_mode() copies the firmware payload, excluding its four-byte prefix,
into a fixed 15.5 KiB staging buffer. check_fw_sanity() already proves that
the image contains its seven-byte header and validates the declared image
length and checksum, but it does not impose this boot-mode destination
limit.

Reject images whose payload does not fit before allocating and filling the
staging buffer.

Fixes: d12b219a228e ("edgeport-ti: use request_firmware()")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260701053535.39951-1-pengpeng@iscas.ac.cn/
- drop the redundant short-image check already provided by check_fw_sanity()
- state that the issue was found by source review
- add the requested Fixes tag
- rebase onto v7.2-rc4

 drivers/usb/serial/io_ti.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index 07c0eff3bef4..cc28f5869a3e 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -1464,6 +1464,12 @@ static int do_boot_mode(struct edgeport_serial *serial,
 		/* Allocate a 15.5k buffer + 3 byte header */
 		buffer_size = (((1024 * 16) - 512) +
 					sizeof(struct ti_i2c_image_header));
+		if (fw->size - 4 > buffer_size) {
+			dev_err(dev, "%s - firmware image is too large\n",
+				__func__);
+			return -EINVAL;
+		}
+
 		buffer = kmalloc(buffer_size, GFP_KERNEL);
 		if (!buffer)
 			return -ENOMEM;

