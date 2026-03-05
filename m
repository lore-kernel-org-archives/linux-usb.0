Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61901386431;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709328; cv=none; b=kdtE45vE1ECxa9wUY3gBuAA0UVPBgyd4hPkIv77La6zPB59kk52hyuRI51hiEUTGkaSah7Qc568kaMgimOsLlbgMhJqtI7a5Ipd1bYmIr3d92Dzuy+OqPO4h+gbDk6/CukO1Ne34h2r3BdqWl6LGouryw2Vu4riacF4KLVP2KMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709328; c=relaxed/simple;
	bh=1AiE2nAY8josHKUT6kRxF3mlw9VySkREoY8DEdUcpGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+tK8aQlPmeinL5HJVknJe102TioOGzAmzdwFQCqkSplr+5xIU1YLBn+YazBouP+Jaj2qUn4ZRcQsLu7KTTlBiSL0tlu1JnNEM5N6bRqgPMqJTUGQDMHPj63kkw+XhnvvgHGc9CVr09Q+uBjtEkihHCRrIsAXKb0V4T17j8mk3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkG59GJq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkG59GJq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF7AC2BCB5;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709328;
	bh=1AiE2nAY8josHKUT6kRxF3mlw9VySkREoY8DEdUcpGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MkG59GJq43BLzxauzkA2VuaFTA51HPRcraXUuKuFZHJRj1RPPpVWUFDN1yr5Olq0J
	 nCkZIckUM+czN1a6txyttOr53oW8kU5+YOeui6YBRL4gtd44OmrLIvE6gLRqpzcoxU
	 wNzlLVYd+u0rNqMzG0IzLrLYJ2gJ6QjbZ1F/FRR6Se+R44JVfZUXvbyUP/ORzpAUQ0
	 d0wtE9ZLUUd7Mw/0pFZ94ldqAq+y47AIuxDMnaYhieZ4hDkVj8px1YiSpMJgp5LmFG
	 LkcO3pw5v8Q7M2uqAxN8ZYKzUDPw0SCXIJh4RM+G+ByYuv04N5FBTFk7vOINaGjeVI
	 nJqLXqENhukNg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy6ft-000000004nk-3tki;
	Thu, 05 Mar 2026 12:15:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/5] USB: trancevibrator: drop redundant device reference
Date: Thu,  5 Mar 2026 12:15:10 +0100
Message-ID: <20260305111511.18386-5-johan@kernel.org>
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
 drivers/usb/misc/trancevibrator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/misc/trancevibrator.c b/drivers/usb/misc/trancevibrator.c
index 6aaec2db360b..37f6b79889a6 100644
--- a/drivers/usb/misc/trancevibrator.c
+++ b/drivers/usb/misc/trancevibrator.c
@@ -92,7 +92,7 @@ static int tv_probe(struct usb_interface *interface,
 		goto error;
 	}
 
-	dev->udev = usb_get_dev(udev);
+	dev->udev = udev;
 	usb_set_intfdata(interface, dev);
 
 	return 0;
@@ -108,7 +108,6 @@ static void tv_disconnect(struct usb_interface *interface)
 
 	dev = usb_get_intfdata (interface);
 	usb_set_intfdata(interface, NULL);
-	usb_put_dev(dev->udev);
 	kfree(dev);
 }
 
-- 
2.52.0

