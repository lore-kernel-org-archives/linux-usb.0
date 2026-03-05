Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AD7370D6F;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709328; cv=none; b=WcngKOTSBslBSKa6UQPvayhxA9yhlRcev74xhUHYOB4aZyz6J50Du/lAGJ2RPrKuCRFcJcFyeDKjBirUuMGEcWD1qb+fysNvRmn9r6sbUbs4fV/AElkr8vr4tcEcE2/7rx2KA0E/+jXnU7ZuahrG5V+sfwCe/mKZoQPR0DJY76Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709328; c=relaxed/simple;
	bh=KiK5Y9NZw9Swe3ZOWiVZxoM5uaXwYIAh7q6GAC/OnmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=COZ76G9HskdBtyRlrIR2EkqCMQtiT4Iq6tQr2PDPiuqfTZmunO9Cw+p0whFNFqtTpMEDtSRi4gceFy1iXzdZ8npRhbQdHnqtReoARoUX22x+3GnREkXW96oAZ5qTgLvQzE5Q9GmfERs5FLq+IjwHd3VcwIRpxSef+mL3aZfNu+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2vRjvai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2vRjvai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E17DC2BC9E;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709328;
	bh=KiK5Y9NZw9Swe3ZOWiVZxoM5uaXwYIAh7q6GAC/OnmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p2vRjvaiKkbuvo9rWcQdHrTxPReL/3YqQgSmc8ig+jpXVcAdNovnasuzukjZ8vJ9l
	 T/5bnkzMD/XVHYF03rFcLgbyKTzPmWO8tga6g++CCeX9wOQCQSN5DL2XezRzt56BbZ
	 CAWG3dBBBAzng+6tlqwWC1VyfsMPkq5AfBpZijnCKtaOG6ai1aSygHFjnj16P+JPFX
	 NWZ4AUSOf41Xnap96m8R9GyGbM308M2OH0s3u8wT9glXM50e9KgZ3fncyS54frGwaL
	 OA376x0nd6w7fCr7ci+pKOQj9GbiLfu7NSygBOHCwdsr8MazW0mu/pjoMJOPzJ35vm
	 y4t4og3jZwzTQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy6ft-000000004nm-3wTI;
	Thu, 05 Mar 2026 12:15:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/5] USB: usbsevseg: drop redundant device reference
Date: Thu,  5 Mar 2026 12:15:11 +0100
Message-ID: <20260305111511.18386-6-johan@kernel.org>
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
 drivers/usb/misc/usbsevseg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/misc/usbsevseg.c b/drivers/usb/misc/usbsevseg.c
index b37bf53dd54f..89d25fcef642 100644
--- a/drivers/usb/misc/usbsevseg.c
+++ b/drivers/usb/misc/usbsevseg.c
@@ -312,7 +312,7 @@ static int sevseg_probe(struct usb_interface *interface,
 	if (!mydev)
 		goto error_mem;
 
-	mydev->udev = usb_get_dev(udev);
+	mydev->udev = udev;
 	mydev->intf = interface;
 	usb_set_intfdata(interface, mydev);
 
@@ -338,7 +338,6 @@ static void sevseg_disconnect(struct usb_interface *interface)
 
 	mydev = usb_get_intfdata(interface);
 	usb_set_intfdata(interface, NULL);
-	usb_put_dev(mydev->udev);
 	kfree(mydev);
 	dev_info(&interface->dev, "USB 7 Segment now disconnected\n");
 }
-- 
2.52.0

