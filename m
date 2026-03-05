Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B289E378D99;
	Thu,  5 Mar 2026 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723871; cv=none; b=DJXbzFEfRrTqTxcu3oA6J4ha4KxJWLx9ucHDbN2Xx/pXCNWCPGOhoYaLmYy4xVa8aq9DnxqxHvx8BrHQ8cxjhWJONIriGHrO8kR1D7N8Lubzw+XRQ77tMgqi+nmsKEFOfVNWlFlUpFT1xT7UDUwiisMeoVuUMV8cqbk/hbe6oOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723871; c=relaxed/simple;
	bh=85T4a9tDQeqQgooF6tLkpLk28kfophnD+5HJrDO7yL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fd0iiQO0SwWwPiGYl6iUexZcVgsLhQ7iQKDx1kC5LNIotum1DBztVn7ngm4c8Torrnr1XxsejR0mcv4qWHHccMJF1u11iVMxIXXHC2exqcnQ83ub7M+cm6L8sdL/P/Yf2fwwCVIXBXrVhp9dqOvGOppWZQshQmAeLAiCFbnkHHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtF5wWdq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtF5wWdq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901B1C19423;
	Thu,  5 Mar 2026 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723871;
	bh=85T4a9tDQeqQgooF6tLkpLk28kfophnD+5HJrDO7yL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gtF5wWdquMkn4PBhkDPj7n2ibXPCunybw2lB63lh0UvqzFok8Bkc5h03N5LrT3OmH
	 aaZPCmvLQuWDnKvku9MtfB6rKnhInY3j2lwK521hABXVHGeHWHgdifpUzJ6uLEJ0ES
	 thBaGSpdIB8RvtXxbCgN1L6CJ1kThsiUDOCMNqa7LGz1mP9Q0dcWWkDck5M92YR+78
	 ZcehCHs0io2gt3A3zIArMm5we86N8k1oWqLDsqbNykGrZT3yIfsKpB4uZEuv3OGETg
	 WC2ue7+DFgqYTc48xZAtAvl6cWsHA4osnPNb2Rb8MhWArRJsllFRDgBe2Yh2Sjhclw
	 Tsc63Bc31NSJg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vyAST-000000002jx-1NQG;
	Thu, 05 Mar 2026 16:17:49 +0100
From: Johan Hovold <johan@kernel.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] gpib: lpvo_usb: fix unintended binding of FTDI 8U232AM devices
Date: Thu,  5 Mar 2026 16:17:28 +0100
Message-ID: <20260305151729.10501-2-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305151729.10501-1-johan@kernel.org>
References: <20260305151729.10501-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LPVO USB GPIB adapter apparently uses an FTDI 8U232AM with the
default PID, but this device id is already handled by the ftdi_sio
serial driver.

Stop binding to the default PID to avoid breaking existing setups with
FTDI 8U232AM.

Anyone using this driver should blacklist the ftdi_sio driver and add
the device id manually through sysfs (e.g. using udev rules).

Fixes: fce79512a96a ("staging: gpib: Add LPVO DIY USB GPIB driver")
Fixes: e6ab504633e4 ("staging: gpib: Destage gpib")
Cc: Dave Penkler <dpenkler@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 6fc4e3452b88..ee781d2f0b8e 100644
--- a/drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -38,8 +38,10 @@ MODULE_DESCRIPTION("GPIB driver for LPVO usb devices");
 /*
  * Table of devices that work with this driver.
  *
- * Currently, only one device is known to be used in the
- * lpvo_usb_gpib adapter (FTDI 0403:6001).
+ * Currently, only one device is known to be used in the lpvo_usb_gpib
+ * adapter (FTDI 0403:6001) but as this device id is already handled by the
+ * ftdi_sio USB serial driver the LPVO driver must not bind to it by default.
+ *
  * If your adapter uses a different chip, insert a line
  * in the following table with proper <Vendor-id>, <Product-id>.
  *
@@ -50,7 +52,6 @@ MODULE_DESCRIPTION("GPIB driver for LPVO usb devices");
  */
 
 static const struct usb_device_id skel_table[] = {
-	{ USB_DEVICE(0x0403, 0x6001) },
 	{ }					   /* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, skel_table);
-- 
2.52.0

