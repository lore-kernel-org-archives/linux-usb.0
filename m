Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794976499;
	b=gxxaZff7rdGqbVA0A/gOBRYrG/P2RjrdJRJiN55gb7De86ex3o5wmHLd40VeIkpCEaum
	 uPUQTO1+nDWwB1KXlFY9sn2t7wU4FU5mFSlO/sh8fbGIbkXMYGqz83YudQxHVjn5qPV5I
	 MRq1ofpsVQP0Whl8r0W4FBex0/+gekEaz/yrYbaigogTzN2LAnP4zdbOBmrud/h4G9lwP
	 ecTgzrrxO8amwV+0RlacHdNmBCoRuOK3TrS2pFKbdKHlptalRZqqSUorNNMgOac7EZSbV
	 JNa7utlMfr6CiIcEudMzwXyyp/jtMkarVXK4CjN3yiAbRrGzH4aNLdlaAcOE0YcRgyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976499;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=4ULZ26rZKzrDsQh6a5x/TtrfOd9L7Hko/guiga2Oa4U=;
	b=IdqiHl0kNSvrIoBW+r/jc22X4yYPmji6E/QWxG/TLAXLZRV6D19FAFPd91M0YixPmy9d
	 vPlP/CxbmemH9tMrjW4MbYHKR8mbxh4SCsvyYUBbX5tYRYqPYKSCk4PXOm74NGI9nmLUI
	 hd8HEiwNRRgG6+aCdnmyscLI6ZDaDh+5saCULF5LmGU5H9fzoHfbjAYUQpR9Z+ylwuADG
	 d55YrlvQ4zp2X2zFI+2ZDzzGc6201l17Mw1EQsoL9MvdQ84fC4bAYCBstV5nFhKU69p7Y
	 RyZ7kP4Oe6a0Lii4++xC9dDPMkUW4v3a0vkvglkT2oJZb5ekoHx6G77ImUyMpE850hA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZfydNhm3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAD3606A31C;
	Wed, 18 Nov 2026 04:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZfydNhm3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794976499;
	b=RDfjY3soGc7GTVCJ3zxAGY4DVRPNRUcUS2HSJHWnfuuuLhen+rPNe/wkpwXNf2ZpB/EE
	 PBZuNrrdBrmwZ7VzDRDz3DtD/ysVFN0J+jkskr3JN7qXT6tqT/4n3BbM/4bS3Cin5TcOd
	 cSKkm0E/G+Ue0494TRWfYIy4XrYw9NVFiTI5q3rjluWYUO+h5Mn+0ruxLmaHXhKjHWZF6
	 K9A+LAS/fk0gLTfXZu6gCRHBdGsCBKL32I1uT3qCAAQtJZBLbl6tSzVE5vMrg4yHNbY9A
	 yFUWR1H/P+Q06T2y54VVb8hIUpxH5naogsloyzMl0CSD7H9WgQufgjVoWMg6RLfKuWQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794976499;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=4ULZ26rZKzrDsQh6a5x/TtrfOd9L7Hko/guiga2Oa4U=;
	b=rBkAqom8zrTCPoIgntm1iLw1i1d/QsFFa1aMQ1tdz9mRRu+KDajKgWIQ8VIy9P5xv7cx
	 XP8EnvAj3xz7iYJiqxe+b8byWs7mD9Vu3HlSaUtFfpib1ZoPxqsFEjclXGcIxydXha9IQ
	 S6A/02XZSsGJyM0Lfx90yoykeDIlztmATXDEKlyZjOahwsdlXlapAFI7K90HIfAXhlGNW
	 JW0DbHQCUMFh1H8cd/3oe101l1ywb+u6drhqjPuaj2gqm/AOPWhvCSN6dqED1v8r4CvkN
	 jMdbkaVDr3NYpdwf0q4ikIu/MrDT/r939NJXN415MU2OlpKiV1Azovq8e0qLV+I9S8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 692B71F000C4;
	Wed, 18 Nov 2026 04:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794976498;
	bh=4ULZ26rZKzrDsQh6a5x/TtrfOd9L7Hko/guiga2Oa4U=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ZfydNhm3pijhWk5LMc2/oz/HZgvdnXCh0bwHvNVTs9uY4HV7l4RjRYgcNuaqHQU81
	 Kuasp9dsoV0MrDh4s2uvMt2E93yjLPFhR1lm4E8qz1lVikApUU91zQQeQSm40QSis0
	 8SQWvqbiPuKEGFrZ7AMj4VxBMIi9R3GfkIpAiNQ1lPgo7YZUL6KGusfQELNI+gHy2v
	 LFIpEqYLoIRM16tRWkdxgRgKBpCbxpxumf77UdmG5mSAoWzY4RQptSkWgCWoTQ6r2U
	 bOG14YnsArAOZsf6Q9FjvXTtRAWJHjzSHNZSkdU7qFwttgrt0IyBezBr7AruDQfVC0
	 sIiV4o6l2wMCQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BE1664ABE3;
	Wed, 18 Nov 2026 04:34:57 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v5 0/2] usb: core: Pair ports of different host controllers
 through their connector
Date: Wed, 18 Nov 2026 04:34:57 +0000
Message-Id: <20261118-usb-port-pairing-v5-0-5f1a26789270@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTWrDMBCG4asEraugGf0Ed9V7lC5kaeRMaWwjO
 aYl+O6Vk40JJssXvnnmJgplpiLeDzeRaebCQ1/Dvh1EOPu+I8mxtkCFDgCUvJZWjkOe5Og5c99
 Jn1RyLinfIol6NmZK/HsnP78eXa7tN4VpddbFmcs05L/7zxnW3Qt+Bqlko9WJsIlIET+6i+efY
 xguYuVn3AK4A2AFjE3Wg8cmQXoG9BbQO4CuQHTBUWyNNhCeAbMF7A5gKoA26tD4GALCFliW5R+
 tLDc7hQEAAA==
X-Change-ID: 20261110-usb-port-pairing-af0f66f0ab2e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mathias Nyman <mathias.nyman@intel.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794976497; l=2005;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=W6RRPgLj/J961XutA4b1O7EtaSTpv9juv7uvo92JAp8=;
 b=I657dMRDQIVEhbu7V0keIZF62n+9Y32jpGwBeXV0imoXToH1EmURS8gD1cTy+IaViNbdsmueO
 /UcFxd1RVNZA4JzILx3850q09Ytim8JYewsRFAUnzlebQixkJUCvdf0
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

On the RK3588, the USB 2.0 lines of the USB 3.0 host 2 connector go to
a separate EHCI, so the USB core pairs its SuperSpeed port with the
wrong USB 2.0 port, and a USB 3 device present at boot stays at 480 Mb/s.

Patch 1 pairs the ports through their usb-connector. Patch 2 resets the
USB 2.0 port of such a device once, so that it retries SuperSpeed. The
Orange Pi 5 DT follows separately and needs Chen-Yu Tsai's usb-hcd
binding [1].

Tested on an Orange Pi 5 (7.3-based kernel): a USB 3 disk moved to
5 Gb/s in 3/3 boots, 6/6 xHCI rebinds and 2/2 runtime-suspended resets;
a device that stays at high speed kept its driver and a running read.
Not tested with an external USB 3 hub.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

[1] https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/

---
Changes in v5 (all from Sashiko):
- Patch 1: look up connect_type by the controller port number; don't hold
  back a port without a matching peer; connector_peer is not a bitfield
- Patch 2: reset through usb_reset_device(); keep the device if the
  SuperSpeed port can't be read or is connected; hold its lock until the
  USB 2.0 device is gone
- Link to v4: https://patch.msgid.link/20261115-usb-port-pairing-v4-0-25d3c9adcc21@gmail.com

---
Arun Iyengar (2):
      usb: core: Pair ports of different hubs through their connector
      usb: hub: Retry SuperSpeed for a device stuck on its USB 2.0 peer

 drivers/usb/core/hub.c  | 158 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/hub.h  |   5 ++
 drivers/usb/core/of.c   |  87 ++++++++++++++++++++++++++
 drivers/usb/core/port.c |  70 +++++++++++++++++++--
 include/linux/usb/of.h  |   8 +++
 5 files changed, 323 insertions(+), 5 deletions(-)
---
base-commit: f11fe7603df07fbb9fa02b0d385c1696c87a6dab
change-id: 20261110-usb-port-pairing-af0f66f0ab2e

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


