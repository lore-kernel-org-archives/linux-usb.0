Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC43B7B66
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 06:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762632; cv=none; b=Z0iK4tkCuBD8C0vy25uXPU30oe45xDa9iaaofEQeJqbmHvE4PtdQS1y3yNL1uXFHOeaxZBN7n3+EcYr72W28L1fIBx5fcJ2TnAaQWB+CxZSv3uNF+Dzc+3xcwpxQCHu8GQCC/GJuWwBTBUeerBNGNwwaqwBzLoC2xrOtJYohKiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762632; c=relaxed/simple;
	bh=5VmiqDiCpinOaN/eMxd+KtwJB1PjHig9pTQ7hWfug1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GlzrBU5Jvl8DWt9n3Qw3yiN5nLOMVq9YBkxi6b1w8TOOhH4SwYLIAXUkmRBQmmIVbBoz63kvB/VG89tdB7ZSaWdF7J5XCA6go09FjFK2lxQaKOroAgVfmT78y1xS9HR6OSQ07k4o2POyLn/K3JamZ/wNE0j0vU4botumqOhCxUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTwyTzDY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTwyTzDY"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cace91f112so25974605ad.0
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 23:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762626; x=1789367426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCe8URlR9PJXBCRddCqyJot5LzLIlOXEphL18tnptgU=;
        b=oTwyTzDYZGD/uieRzoTKghSgVNazW19uQLmSPfq6sgpgHuZOQvrBV8mOBpNR9UXSDN
         WN9EarTQh0JNlUFLfKzq3DeG9mfYutoAHSeVNQ7MMzccnXSHS5v/vhAe9eM5JkctrHKu
         r09LtrVK8Ey72FJXe8PeuGitcZT2o/krHEojQZDQIPIrCEnNhDWLQqjV64QU3WesqZmP
         V0+6bsUkJfi0AhEv1OB22IfSxGU+gCpLElnxnsNDPsoiUo8Jq/HmO9Ews5mZ5aXvrgGl
         HBItPNhejrAOIjiFwXt8lGCqLpdG+isU7qN+XSdmrfl/P2JokSj2ALwCWrWwlScSLSU2
         IDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762626; x=1789367426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCe8URlR9PJXBCRddCqyJot5LzLIlOXEphL18tnptgU=;
        b=ZLXsjs4ABNx7jZUFenfTUNf3yL0nGuLQqRCu6AEcHu0c6B7MCuLZYZl01SsOQ6jAiz
         XBttS7sCjnACZnBrxkGrMZmuU6HBGL47VOxNs+cNDvCtQ33o8RdwcDRSIbbqYxFuqY/w
         d7F9cblrBvT4yElRdvh2ife487sAXFo42CZuf4DToZXsW4FMF/Gl+TcST+YAIpbmFILr
         nOdZc5NJHxN6oEWiZ7Vp4us5VSM2IhMXyo6pWZurVv7kmgxeZNzE315vo1dKnLt76v4T
         YdUXKni18tMQUjU2IGaLaLTqMBCBcDw3+FlfJPj6Nxe+CiCC8rutQxi+F0KDzCLXioYG
         XVAQ==
X-Gm-Message-State: AFuF++lfI71GqvlL9dm05j9VTatRyO0luURjEL/qTtiXhkU+nX8+CnnC
	Jbq7dRwTkPl+UgW+vatFcsjCt2UaBsLJa0APgSkkWMNVB2Y4wlfEJ5Qg
X-Gm-Gg: AYBFou2oAB9pTibdoWV6yLGT4s8rXqoKUH36bJ5ZnB5EeC6+EGReTDRW4mneGD2tXRn
	ZvlwSnqjpU2T6bMwoTbFjqLKcaeVV1AdADhdJ7mjEqQBLbLBkWDaaoTU601wTxrtSIhRWK45QKG
	oyTfp4ZleB3ntv32wHdcPzNsEw/M3IAPeNELW0tjsaMgOQIGz/z//kALYXNg1MYylj6LMcVPvSJ
	07r6qOYx3ZuRyqrCrm0IkLK7lmSMpDHo+ItLCzah7vdX4kP5W7gZdH1fpHgGQPGIOsJubp0glf7
	bSS2HK5XSNCMtULtuAGRmImp2IbI0+Ux6C8j3GJyE03PcZSJLKDXU1VZUN4jlicGejTjJY+7EqV
	KRLxdayG3uz9FXE8AyAa8ThZTG6kUs7F/H9dV++Hxrz8OOnYmrR70IfQxhe/Dm/MWpSXg3fDM6E
	o0O+pRDk6ER8Eq4+ds3AYBYZFZMRp5xxfRCcj4a0G45uckWTB+t36G0gG0pgPK/OXqC88spzGkq
	PztnguEJAvxjg==
X-Received: by 2002:a17:903:98f:b0:2d8:d4d3:3fc0 with SMTP id d9443c01a7336-2db12678d9emr326600725ad.20.1788762625902;
        Sun, 06 Sep 2026 23:30:25 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm24018284eec.10.2026.09.06.23.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:30:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thunderbolt: fix typo "forwared" in comment
Date: Mon,  7 Sep 2026 12:00:21 +0530
Message-ID: <20260907063021.18945-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "forwared" to "forwarded", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/thunderbolt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index d48623fda79b..faf1f61252d6 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -369,7 +369,7 @@ int tb_xdomain_request(struct tb_xdomain *xd, const void *request,
  * @uuid: XDomain messages with this UUID are dispatched to this handler
  * @callback: Callback called with the XDomain message. Returning %1
  *	      here tells the XDomain core that the message was handled
- *	      by this handler and should not be forwared to other
+ *	      by this handler and should not be forwarded to other
  *	      handlers.
  * @data: Data passed with the callback
  * @list: Handlers are linked using this
-- 
2.48.1

