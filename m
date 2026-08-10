Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6733AFD08;
	Mon, 10 Aug 2026 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354723; cv=none; b=YKcnT6npLWIlpZvEpm5KiBtcYHVMcgJbfxpctEIzcV2L95mQHTBYnYGjpuPvCe2Sn+anjd3ESuGxYEzjDdw2Ovd5tx+wrtvqBW8N4DQISFYuG9VAAAANY2lgH+iZccGl8usJOmjLFxem46xvN5Ig2pfcrEflROtIZk4rCLll1Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354723; c=relaxed/simple;
	bh=30gKJksUBvCxM80pwVWmcl90ABwG5Q9q/pg+bFx3Og0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NA8N4agmJe5JFAfRYh6qaeQWc1x/W6Q8ZVD3sL4fSliUyXrBPk306ZbG4bPydbsBk5VDs3BVnIz2ONS3Fny3ek11ODN1EmBgk2aeb36Cew51QaYnFFku26lEguiQDofDa59y/i5bQQxU+39ruH97f0NIUpqWaDzF7DvjW/lpWeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sw3R9rnv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sw3R9rnv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15B3FC2BCF6;
	Mon, 10 Aug 2026 09:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786354723;
	bh=30gKJksUBvCxM80pwVWmcl90ABwG5Q9q/pg+bFx3Og0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Sw3R9rnvlWUnrKwXd30Y+//xiGTaTFVrh5qYwccZTFe9HCgH3sSf2bEhqeoSAs1wn
	 NlAF+hk1lhnHkU25p3yqnMDrOUos6YzPl9u1AZpLJ2bLlD2uneieau4VHgyDo6Io8z
	 Lb3uFeC1cpMGhq6zOQ6HwaKrCSMR0qYI4B0Bog0OHh/Yglu1I8flQY5j9A/LDu+M7H
	 OMNsyqcKLyqfh5XQlIoSTSEYuVcqYNKTcI6W5j1l7MEAE5kcAjbbh25lEW6BolUoup
	 5pWHhFwggSC1Tz1cXfFwW1+zKBchCRZ79y3WtaLydRbb7dMsLzIh76x7c/KDo1dB00
	 L1qRvi7Eoe5ug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A45C5AC82;
	Mon, 10 Aug 2026 09:38:43 +0000 (UTC)
From: Fan Ye via B4 Relay <devnull+fy15309206903.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 09:38:43 +0000
Subject: [PATCH] thunderbolt: Use min() for the DMA path credit cap
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-tb-dma-credit-min-v1-1-1ea9d3847e7c@gmail.com>
X-B4-Tracking: v=1; b=H4sIACKceWoC/yXMQQqDMBBA0avIrDuQiGj0KtKFyUx1BKMksRTEu
 xvt8i3+PyByEI7QFQcE/kqU1WfoVwFuGvzIKJQNpSprZbTCZJGWAV1gkoSLeGyMNS3pqrXUQO6
 2wB/5Pc/+/Xfc7cwu3SM4zwuzgkX3dQAAAA==
X-Change-ID: 20260810-tb-dma-credit-min-78b89d149bd7
To: Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fan Ye <fy15309206903@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786354722; l=1319;
 i=fy15309206903@gmail.com; s=tbnet3; h=from:subject:message-id;
 bh=xu76tpRxhyIN36dOBysJ1tAL6rwd3DghIfQIiVfsYhE=;
 b=jqWnKrgvjW6j0B80u8b+Vddx63b36o0xKfC7tnxw2k39fcYyzw4zMbTqiuu5+yrsgqFihV+e6
 T6xYaUFtMttDAmlrFkK0P1RN/mrTqMkb3jystyKRl+kwndb3XVYgljk
X-Developer-Key: i=fy15309206903@gmail.com; a=ed25519;
 pk=6QsQIrI/kruYWIJyCH9ntPMXsHCqF5JtK/DCMtOCzdc=
X-Endpoint-Received: by B4 Relay for fy15309206903@gmail.com/tbnet3 with
 auth_id=929
X-Original-From: Fan Ye <fy15309206903@gmail.com>
Reply-To: fy15309206903@gmail.com

From: Fan Ye <fy15309206903@gmail.com>

tb_dma_reserve_credits() caps the request against what the adapter has
left by decrementing one credit at a time. The other arm of the same
if() already caps with min(port->total_credits, credits); use min()
here too.

No functional change: the object code is unchanged.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Fan Ye <fy15309206903@gmail.com>
---
Verified by building drivers/thunderbolt/tunnel.o with and without this
patch (gcc 13.3.0, x86_64): objdump output is identical, a single cmovbe
either way.
---
 drivers/thunderbolt/tunnel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index b7f32305f14a..e9214de5f3b7 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1778,8 +1778,7 @@ static int tb_dma_reserve_credits(struct tb_path_hop *hop, unsigned int credits)
 		if (available < TB_MIN_DMA_CREDITS)
 			return -ENOSPC;
 
-		while (credits > available)
-			credits--;
+		credits = min(credits, available);
 
 		tb_port_dbg(port, "reserving %u credits for DMA path\n",
 			    credits);

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260810-tb-dma-credit-min-78b89d149bd7

Best regards,
--  
Fan Ye <fy15309206903@gmail.com>


