Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6006738642F;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709328; cv=none; b=SzSU93PgA33ivZ6ZZSUprm9/81XOJ0szuBms4y6PyrlNcJvHd21nIgw0DBuZ3fix7IkVj9xwu0i3bMvEOgvy5jAwJ7vCjVI7ISreU4AzaZOcZ6ZbcLCa3XsSum2yMENpVMKLh66KojG0Egfte8Pzr/JMoD6MrJfFgbc/9ZfivRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709328; c=relaxed/simple;
	bh=hGq0+CM200unysQdJAyOZo6M3b9G1AjRQPl31InwpJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCUs5ZxqieVbC+mQRomu17e4SPDIWvPxTSbcPRiU78oG/3vsfKuWiUaLSTTmzqEd+/MSV3+81zo94NlAkA1pq16J/A03/8Xj2YgWzxfxFK7RDEGeX32fDoPpYX41GXYGW6h2fjy5d6hgDg0mgKIPT+YgmgpkAxxO/DNfyVFWbvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuCYM3Le; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuCYM3Le"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10510C2BCAF;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709328;
	bh=hGq0+CM200unysQdJAyOZo6M3b9G1AjRQPl31InwpJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EuCYM3Le5f0YUBWsPJ86WUx8jv/W1aLzD5iFbpHizrClP8/S/zrKC76bJCpRWFC0a
	 DsKr1OH77PEsSuV+dGtOJUiS3hqAGlQAJ7bQMLTZqyYOZ8GyMfWFVp74x/nEVS0j4K
	 SFErcwR5ru557L6T7r8cBUaoX70RdLstc/BRyZBvTYqT1DFYb377EqHV4uHJQoyJj5
	 WkCFOFsH34TNlYIOfRzlOGsmmB2Vd90HZDSZvch3Wa+lvAbVxcfVckSUOmzM3u5UYm
	 TnGCDkS3ICugOEY6hJtWTrjF8HdltnRMkFH5kNpKikmHqquf2epKRQfm/X3Oufz4w0
	 seAw90+TTAy8w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy6ft-000000004nd-3lOW;
	Thu, 05 Mar 2026 12:15:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/5] USB: cypress_cy7c63: drop redundant device reference
Date: Thu,  5 Mar 2026 12:15:07 +0100
Message-ID: <20260305111511.18386-2-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305111511.18386-1-johan@kernel.org>
References: <20260305111511.18386-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/cypress_cy7c63.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/misc/cypress_cy7c63.c b/drivers/usb/misc/cypress_cy7c63.c
index 99185fc3e9df..4a7f955ba85b 100644
--- a/drivers/usb/misc/cypress_cy7c63.c
+++ b/drivers/usb/misc/cypress_cy7c63.c
@@ -215,7 +215,7 @@ static int cypress_probe(struct usb_interface *interface,
 	if (!dev)
 		goto error_mem;
 
-	dev->udev = usb_get_dev(interface_to_usbdev(interface));
+	dev->udev = interface_to_usbdev(interface);
 
 	/* save our data pointer in this interface device */
 	usb_set_intfdata(interface, dev);
@@ -239,8 +239,6 @@ static void cypress_disconnect(struct usb_interface *interface)
 	 * device files have been removed */
 	usb_set_intfdata(interface, NULL);
 
-	usb_put_dev(dev->udev);
-
 	dev_info(&interface->dev,
 		 "Cypress CY7C63xxx device now disconnected\n");
 
-- 
2.52.0

