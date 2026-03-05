Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC8385536;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709328; cv=none; b=gCA7NIeUnYWke6Ll7IEQ4BupvknrPAeUjIxs0MNbA0yjHeLjrCm2ZfE+VFX/Dl3+tspB5eyfG1Z+1txC8eYt1vc3VncGcOI1LZONoVpFkmh6/qYcDR6NCSSsUHnT+itHTCrBD8VdAcyHT/jLxFk+KNlZjV+LczEZgtmMULNL+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709328; c=relaxed/simple;
	bh=LHTW92pouoy0ryE6AcSXfrvIRL/W8q7FUWuga+ffaF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKWxQs7+AAW7TKh3g3itikVue0os/mzS8yk2qYnYb0/tgynzIqfd1GFV4mi2ffnpQ7vcx7GzUP1PyNK+5BaJswGKDaNsh23bqQbK63606QVpDNexz9qSgJXBDySXAhndIsNHDxjk3WyTvc40IHw26xXh58Zh3kL74VT5xxOpDZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYjST4up; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYjST4up"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADA5C19423;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709328;
	bh=LHTW92pouoy0ryE6AcSXfrvIRL/W8q7FUWuga+ffaF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NYjST4upKGCaQ6j7GAPkO0fgJAlvnfWbKdPM0k0qU8XPUhT1uMgBg1/qoK/8/Mye1
	 z1WDJSxoRQykGiIWzgFUvj4evhfhAQo2ddwcDOyPn7MwBfjDh8OBLRKtd/JkBVoqpX
	 azijyC2ntOZ50f5anboHRPKbOATm+A9D9h2td9h/hn+A2elSam4dvufIyZ85Lr4Agn
	 xN0v6uYQ/jJ+JOeX9R8BBpiip78lSCGMb7v0E+BbGdVxtqKADuzJUSRH7HXo6NvpMU
	 va/tboUwV0oQ9kdqdR8urA7ha7wS2vsi1Rq1R3w8pMR+SIwf0stlLIjjonyLV+RswI
	 6oUH+1RdHGySw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy6ft-000000004ng-3oJO;
	Thu, 05 Mar 2026 12:15:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/5] USB: cytherm: drop redundant device reference
Date: Thu,  5 Mar 2026 12:15:08 +0100
Message-ID: <20260305111511.18386-3-johan@kernel.org>
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
 drivers/usb/misc/cytherm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/misc/cytherm.c b/drivers/usb/misc/cytherm.c
index 2bf082474e9d..b183df9826bc 100644
--- a/drivers/usb/misc/cytherm.c
+++ b/drivers/usb/misc/cytherm.c
@@ -311,7 +311,7 @@ static int cytherm_probe(struct usb_interface *interface,
 	if (!dev)
 		goto error_mem;
 
-	dev->udev = usb_get_dev(udev);
+	dev->udev = udev;
 
 	usb_set_intfdata(interface, dev);
 
@@ -334,8 +334,6 @@ static void cytherm_disconnect(struct usb_interface *interface)
 	/* first remove the files, then NULL the pointer */
 	usb_set_intfdata(interface, NULL);
 
-	usb_put_dev(dev->udev);
-
 	kfree(dev);
 
 	dev_info(&interface->dev, "Cypress thermometer now disconnected\n");
-- 
2.52.0

