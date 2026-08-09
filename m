Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD84D4B04B4;
	Sun,  9 Aug 2026 02:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786243092; cv=none; b=sYP+d985sMiPurzTOZzA8O7/53jal/0TQQxjOEJ31RBWkiIzjmrd0IV+mfATCQIz8BQuOJ2U/bCccSeRfOwGHzoYakxGMnEAG26qVrFcDd6jMdIC6mY9wDVsBf1EfBno7ATZvfge7xacPhcUbwFumAtLyPXAmP8xzMb+FzPO+mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786243092; c=relaxed/simple;
	bh=JGHEQB9xqdmLH7borF5oKPJMKHbcWq2QyL5wnqtfxRo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TRpF4+W7/kHtgGisUraw59pqVCAwadRxvDEVgB6riRY1RzwFPHbnwM1Tketanzd2/tN4Zl2S8jSTsjL747SQfSdRuwodcpKPXFApfL1brhDCUUXfR/86tXPfNwXJNxfBlQc6GYJx1R0PNqVoyalX2RjVdN1pRq34kc9HN6wADes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpCv1LpP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpCv1LpP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C0F9C2BCB8;
	Sun,  9 Aug 2026 02:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786243092;
	bh=JGHEQB9xqdmLH7borF5oKPJMKHbcWq2QyL5wnqtfxRo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=IpCv1LpPn86QN3yWEUtI4gizL87rdV3VyHbRDx0xKFQvTGQBLrSLl7IDdnnmPyPLW
	 xSoa8vyasHgKPaeBYGKvPETfOPveMiFmY1boegoao8YG81kVZLpiRoo+c5G+wtwmLC
	 yKb9VKRYPiAYEuLnxVbfTGC24OV5Iw7/11WqHOVbEbaCuoqKSC1ClovHH5Ybgg6dzt
	 JnkW8SWfTuR4vV0DWDw3/PJSe3kQkPAgHcZl7ZIsYbI31ArsnKTeRPu2bRS5SRAro3
	 e+T6pYVaVtBvGmWQCWZtcku8OeIn9qa8ccMvDUPGa3C6BgYmXslhldxYpdtKOPSxDp
	 /eaWWMn1iSsig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797A5C5AD2C;
	Sun,  9 Aug 2026 02:38:12 +0000 (UTC)
From: Fan Ye via B4 Relay <devnull+fy15309206903.gmail.com@kernel.org>
Subject: [PATCH 0/2] thunderbolt: fix teardown reporting and the
 pending-bit wait
Date: Sun, 09 Aug 2026 02:38:11 +0000
Message-Id: <20260809-b4-tb-teardown-v1-0-c88bbfe5c127@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABPod2oC/yXMPQ6DMAxA4asgz7WUuigCroI65McFMwSUBKiEu
 DspHb/hvQMSR+EEXXVA5E2SzKHg+ajAjSYMjOKLgRRp1agWbY3ZYmYT/bwH9KTdi+qGXKuhREv
 kj3zvYf/+O612Ypd/FzjPC6fH6IVyAAAA
X-Change-ID: 20260809-b4-tb-teardown-d26c32482c96
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fan Ye <fy15309206903@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786243091; l=2788;
 i=fy15309206903@gmail.com; s=tbnet3; h=from:subject:message-id;
 bh=JGHEQB9xqdmLH7borF5oKPJMKHbcWq2QyL5wnqtfxRo=;
 b=wujsELW0tYAZCeeJxaTOhZa0AaP929WuYWIy9OWSvITVoaYJMdPJ69XR+Tca1Z89Aj8kc9U1p
 IN/A7Ln+peIASkvbV3s7nlHiOs8sSmb5ILfhh9bFgq8Y49me74MVHEe
X-Developer-Key: i=fy15309206903@gmail.com; a=ed25519;
 pk=6QsQIrI/kruYWIJyCH9ntPMXsHCqF5JtK/DCMtOCzdc=
X-Endpoint-Received: by B4 Relay for fy15309206903@gmail.com/tbnet3 with
 auth_id=929
X-Original-From: Fan Ye <fy15309206903@gmail.com>
Reply-To: fy15309206903@gmail.com

Both of these come out of the same investigation on a pair of ASMedia
ASM4242 hosts wired to each other, where every teardown of a host-to-host
DMA tunnel spends the full 500 ms pending-bit timeout on the host
interface adapter's hop and fails anyway.

  1 gives the software connection manager the same contract the ICM one
    already has: return the first error seen while deactivating hops,
    instead of returning 0 unconditionally. Teardown still runs to
    completion either way. Today a caller cannot tell the two connection
    managers apart, and tbnet's "failed to disable DMA paths" warning can
    only ever fire on ICM based hosts.

  2 remembers on the adapter that its pending bit stayed set, and stops
    re-learning that on every subsequent teardown. Cycling the interface
    down and up 200 times across two such hosts produced 213 and 206 of
    those timeouts before, and 1 each after; the run comes out 110
    seconds shorter over its 200 cycles.

Patch 2 is the one I am least sure of. I do not have the USB4 Connection
Manager guide, so I cannot tell whether a protocol adapter's pending bit
is vendor defined the way its IFC, ISE and Path Credits Allocated fields
are - if it is, not waiting on it at all would be the right fix and this
is working around the symptom. Its own notes say what else I could not
show. I would rather send it with that written down than leave it out.

Note what the pair does together on this hardware: 2 leaves the first
failure to be reported and silences the rest, so the signal 1 adds fires
once per adapter here rather than on every teardown.

Two further patches from the same investigation touch
drivers/net/thunderbolt/ and went to netdev separately:
https://lore.kernel.org/netdev/20260809-b4-tbnet-hopid-v1-0-97aaf2aa0fc7@gmail.com/

They are not needed to apply these two, but they are what the runs above
were measured across - the second of them removes a warning splat that
fires throughout any prolonged run of link cycling.

Per-patch notes, including what I am not claiming, are below the cut in
each patch.

---
Fan Ye (2):
      thunderbolt: Report DMA path teardown failures to the caller
      thunderbolt: Stop waiting on a path pending bit that never clears

 drivers/thunderbolt/path.c   | 38 ++++++++++++++++++++++++++++++++------
 drivers/thunderbolt/tb.c     | 35 +++++++++++++++++++++++------------
 drivers/thunderbolt/tb.h     |  5 ++++-
 drivers/thunderbolt/tunnel.c | 19 +++++++++++++++----
 drivers/thunderbolt/tunnel.h |  2 +-
 5 files changed, 75 insertions(+), 24 deletions(-)
---
base-commit: 06cf61899d6498b33e4b7c87d99d5bd471ccc375
change-id: 20260809-b4-tb-teardown-d26c32482c96

Best regards,
--  
Fan Ye <fy15309206903@gmail.com>


