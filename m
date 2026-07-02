Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B166433E7D;
	Thu,  2 Jul 2026 18:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783018161; cv=none; b=UAH9OVev4eG0Z9YohB1E/QTzlWY5UYWL7I4wiaGw0BnOM/Phw8VA6fBxfhsjGmefkFOsHhoeP1XcbPEqluhs+T65lMNK0h9e+RgYQ0AU/0pdiVKDENRYG37R2yJOXC0/Thjo5m5C9vcMO1YL7PGYR4ObDGyronCikhMRBieyU1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783018161; c=relaxed/simple;
	bh=V37kByLjkFBde1zEcUTpDrX8i4FT5298RhSlR/rW+24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PrE/4hrQld2JAD+BjiW/unfnW8lKzPrthmsunZn6GUfKE2v6Odt2xggpCBWNpGj2xa+rQbOAxC955tXtV8vMgBmWfAUFB1o3tnj/EnjaBQ6dL/lW371+z3lUsSeV55eDr0D+3c103F267SU6vPmoqdLKnTiKo3XHuMQj3Mq3A7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sQdLR4i5; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=d/jrZjOU; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sQdLR4i5";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="d/jrZjOU"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4grmBj4GPlz9t9R;
	Thu,  2 Jul 2026 20:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783018157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jox/xtYks7cQO9zmfTENMkbNa9E+Ifocmwm3aK7cMkA=;
	b=sQdLR4i5RSHXlv6GA1zM5xNObCyMKKH5zSH4rjOXqDawUnSgeLXpFB6saFPAtI/aPO2DPn
	2EdzYllAEqUbjGJtTKEVZObi9Kjfgq1yvXH0EwP7XcIS8/Zy9otDIFDNbm6/Y7GzNtEdXU
	Br3yTzwfgwGBW1eIufIlPhQF32V1L8cWQubMY167zRu03hT4XIEFbBZ/MhA8ZgFSwWg8bo
	k5uycYs/+EXlsfOQ73yYbmnvHG+8oSZ4+VbH8qTzuF3oPin3bKn74Hjzi3J2BFasHtruMD
	WZyf/OnRT2tMVArc17qZy4XnH1ebpr/y7HG7/b2Xi6BkaetuZxY+IN6Q6uHbgw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="d/jrZjOU";
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783018156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jox/xtYks7cQO9zmfTENMkbNa9E+Ifocmwm3aK7cMkA=;
	b=d/jrZjOUoe+x/4ThwPflcUy9toUEHKLlNrUmUD98o39cSFcdp1IfpoYM40qELT65jOhsz+
	pK8yTUSGpghiwxB442m8QGcGaluHSZoBs3TEz7UPgmOQIYgpLwDlxrcqljn078kQhrYsiU
	QEvlkBr+RMt7Pm/VSxZmW7iQPuwbFLmYGOpmjdcB7qePL/zZ+0Ug4KYp1J9vBVFoABn+sc
	ryBoA6vIiXi0r2KMH94WegJvtX3dm5g3m11W480IAYoRSYvuuELqfxmQmME+m1CJ4bIfUn
	eXdi3NkF0aZuuC01eLFTCqApeXPNNrK1ZtvnHWTPT6ybgcikwmXEmLFviSggag==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Manuel Ebner <manuelebner@mailbox.org>,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ABI: sysfs-bus-usb: fix brace
Date: Thu,  2 Jul 2026 20:45:02 +0200
Message-ID: <20260702184500.208211-4-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 08522099e0a29c83cd5
X-MBO-RS-META: bji9yxj1axrr1mpdbgtupsgs7erfawk6
X-Rspamd-Queue-Id: 4grmBj4GPlz9t9R

Remove single ')'

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
Sorry for the noise, prior mail I messed the cc up.

Another info: get_maintainer.pl didn't return anything
usefull for this patch.
Maybe you could add this file to the subsystem.

 Documentation/ABI/testing/sysfs-bus-usb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
index af9b653422f1..baf4bf6d32ee 100644
--- a/Documentation/ABI/testing/sysfs-bus-usb
+++ b/Documentation/ABI/testing/sysfs-bus-usb
@@ -293,7 +293,7 @@ Description:
 
 		Supported values are 0 - 15.
 		More information on how besl values map to microseconds can be found in
-		USB 2.0 ECN Errata for Link Power Management, section 4.10)
+		USB 2.0 ECN Errata for Link Power Management, section 4.10
 
 What:		/sys/bus/usb/devices/.../rx_lanes
 Date:		March 2018
-- 
2.54.0

