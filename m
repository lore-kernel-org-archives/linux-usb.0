Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487316;
	b=q/t+93MgLzL9EP/kzhOvc9Q2UO1+M7qbWsHZLae64jEAeJD95xsLDezxKqvG/WNMUdjy
	 h7jkIFuJRfTL5kVaDtcnwwwDWkY3BAefQ7iI1guc3IaIlSB7lOPekNE2A70vFt7kTxLMT
	 MHK/8/AkLJDhYYAp6Vzr8SpN0OWN83blsUosWye3KQGqnw4QDGU8ZGt6HDpNOa9bLLPfX
	 iyv3iY1/RhjYJVCmRAYpaJXxhignJSnY0YncF/tGriktkB6fnA9cuvfX8Zutw/ys4LSuZ
	 u1pY6J+zKG8MYS7UJzLMrRQO8ioUclJxSC3Xv1R8CDxAzOgAMfJ1iWXDFs3ZXetr5BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487316;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=o3DWzlUB91RPeHW7sZDn3F33nnBMtYhjW1YR0tS3IcQ=;
	b=LP9+LeG1louVR2mtfhvCbViILEeCYIwIjGxRiz67bzV6bZdzx4uPnXf91zD5LRhKXf5z
	 XeInIw+jxcLT+0JzVFJUPbiTJlopVQybMJapXzYu4VCR2eNjsrD/xdy0SNskrQJ2zB7H0
	 CEU5onMB4xjWNp4V31ZZkLC3s9SPAlTIm48hMJpw8EqZ7fW/Nynx3wgsjO5gSGpK92j3/
	 vHtqww5I0Jw0RSsGWNNkthdq5LX/MagiGl0NnQqyB6N0EWxEHT3PAnmJGvuT4l2DuuOTz
	 YPFthYK0SoD1lS7HHJwMatkM/ATy3u6T8xVZp0973q/7xpbXGiND+KaQM00IPCREAFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=oT+ug+md;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7E9606A31E;
	Tue, 24 Nov 2026 02:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E7E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=oT+ug+md
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795487280;
	bh=o3DWzlUB91RPeHW7sZDn3F33nnBMtYhjW1YR0tS3IcQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=oT+ug+md8otQ6hWo0Kphy7TbQpKdPetwi7UzcV3gg+/ZLjkSww4nq+ugO77xqCLp2
	 T6hNpDfqSiUxeaJ9P0i5jylNRqiq5BT/WWUv4ePqutpgT8CppoqwvOFjkLh0UBQvjb
	 c/L7AApaIfQv48H+jfH+YbVO+owGlKmBNX7xfyk4=
X-QQ-mid: zesmtpsz2t1795487273t83aed970
X-QQ-Originating-IP: +TlbQFTG7iR3f14eLAjoxHJt/wmpk/Ic6d5bkF3DQC0=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Nov 2026 10:27:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4058606951707521692
From: Siqi Chen <chensiqi@uniontech.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Jonathan Stroud <jonathan.stroud@amd.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: misc: onboard_usb_dev: check i2c_transfer() return values
Date: Tue, 24 Nov 2026 10:25:00 +0800
Message-Id: <20261124022500.1020611-1-chensiqi@uniontech.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MchZnVUuqi2yl73TASl7a1OERAXwBBtoO7eT8MbfpBYezY1ShAai+Uym
	y4xinIbQNNnO3wo5viplF/kwbtVdntQ3MVDPOZD42JBeC9RBmr9XIA7b+F2a9eWe2qTQkMW
	+jN/wKvLUifibAGWHE1ZLpL2fTwKuUYnoTSUuV6VZO+cHlBp75/8JIUmE1QT5xG8G1nixcC
	HxZ1JqPTuMp7lKMoOX4i5nxagubHCgLoh/7WUqmCZVJiGWvjjw/WevdM579HKCAmi0uD7ug
	GeWiDzFCYd+2/RSVDkalVPYHtbqmarNHUHs5CokX2DmrXyp6PhFS/0DCzhRJVYiQtqoHseO
	I5zW9GqH9EPg7Vt6BCSWvVtgxW+xAqVQxh6zs+0WjW2xFWUDKeKg5YS+kBHueZPrf/aG9lA
	vCa7NTnwFGnwen/dEeCZWoP7m9y0uB5666CnUXS3PJxS+p+z4NIT64rIj+Kwk9hNLf6dxSC
	ZUyBues8CGPpOS5oVisjFi7UOPNM8830Klvck0Ngy8CAcISzAC9AZ7Ty3X8yFpGgGhwN/nu
	YsjpHHO7dySo0RhA+W/qeD7RnT66UoZ+JqP9nfUIIosUhEitFgqCPDUo0uKxtAkIUZKPttI
	RRO3Vw+8jwzRKf23gTziqhebGrxggEgj8TvCMozmiPDk2037jUvoauSMOdiT4BlGxQcK/In
	KTb9k7Urm+I/CzlnHu8uBrZb58vgS5VAqiuw8rogBJ3meINEp6xNOj/NWovYE+QEjbb0wT0
	ig9D6VKl3tzQSVg4ekdGy8q+rbEM3DlZkxftYFITnBA89T1EhCq3tqrm3JsYiJmQ+uTWxLz
	1YVD3gpVEBwN0MYQ+NwNi78FgC7gmXQMYe2UPF2mx33TF1yrzAhPzyPHyBlDmNs0ypyPCIK
	fjv9KflKa7J8r4dHlgHAgotK1L368IAg7SFqHXMG5+VUZPraXN1pApjhmvLX2hA5PMJFIP8
	AThawsratidsj0ea5ahg+V9iYA1S2m76rSbPUv49ZBY65WPTjN34jIEf6cFWVkgr0/uogrF
	uA0a7glmR+DvX94JzBYTc9oONC+C7mHc+fCA2kS7ASLpFbhjsfyV5TMebGxrF/YRuds3A2L
	IvGtbly+GWAzHSjUOmuXkJx3WtitxBttA==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

i2c_transfer() returns the number of messages transferred or a negative
error code. The USB5744 I2C helpers only check for negative errors and
therefore treat short transfers as successful.

In particular, if the two-message read completes only the register
address write, the driver consumes uninitialized data from rd_buf and
uses it in a read-modify-write operation.

Require every transfer to complete the expected number of messages,
preserve negative error codes, and return -EIO for short transfers.

Fixes: 1143d41922c0 ("usb: misc: onboard_usb_dev: Fix usb5744 initialization sequence")
Signed-off-by: Siqi Chen <chensiqi@uniontech.com>
---
OpenCode was used to identify the issue and draft the code and changelog.

Compile-tested with CONFIG_I2C=y, CONFIG_USB_ONBOARD_DEV=m, and
CONFIG_USB_ONBOARD_DEV_USB5744=y using:

  make O=/tmp/opencode/linux-build-usb5744 W=1 \
       drivers/usb/misc/onboard_usb_dev.o

No hardware or I2C fault-injection testing was performed.

 drivers/usb/misc/onboard_usb_dev.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index e357cc8af34f..98380f8459b4 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -329,6 +329,8 @@ static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u
 	ret = i2c_transfer(client->adapter, msg, 1);
 	if (ret < 0)
 		return ret;
+	if (ret != 1)
+		return -EIO;
 
 	wr_buf[0] = USB5744_CMD_CREG_ACCESS;
 	wr_buf[1] = USB5744_CMD_CREG_ACCESS_LSB;
@@ -338,6 +340,8 @@ static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u
 	ret = i2c_transfer(client->adapter, msg, 1);
 	if (ret < 0)
 		return ret;
+	if (ret != 1)
+		return -EIO;
 
 	wr_buf[0] = 0;
 	wr_buf[1] = USB5744_CREG_MEM_RD_ADDR;
@@ -351,6 +355,9 @@ static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u
 	ret = i2c_transfer(client->adapter, msg, 2);
 	if (ret < 0)
 		return ret;
+	if (ret != 2)
+		return -EIO;
+
 	*data = rd_buf[1];
 
 	return 0;
@@ -374,6 +381,8 @@ static int onboard_dev_5744_i2c_write_byte(struct i2c_client *client, u16 addr,
 	ret = i2c_transfer(client->adapter, msg, 1);
 	if (ret < 0)
 		return ret;
+	if (ret != 1)
+		return -EIO;
 
 	msg[0].len = 3;
 	wr_buf[0] = USB5744_CMD_CREG_ACCESS;
@@ -383,6 +392,8 @@ static int onboard_dev_5744_i2c_write_byte(struct i2c_client *client, u16 addr,
 	ret = i2c_transfer(client->adapter, msg, 1);
 	if (ret < 0)
 		return ret;
+	if (ret != 1)
+		return -EIO;
 
 	return 0;
 }
-- 
2.20.1
