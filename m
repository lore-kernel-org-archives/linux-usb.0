Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9DB3B3C06;
	Mon,  6 Jul 2026 18:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362317; cv=none; b=pcZ5RnIBsbWqfaH8T7oQHZiBEJPnM+DkJceh8Wuo985g3zOOn5Q7kMTbq2htP4yyKmRui2jGqgOBKsq06o8na5G6pzG70htOi/vCf6+zatJLupr9WwlVS7S6aVR+QO838XxxHHd3lw6No2ZA6VNcBa9KMpMi3OCGdJb5adDVjsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362317; c=relaxed/simple;
	bh=taPYAofwLO2LNO1f+yUAG53BChJyr0Rqs+YiTqHTSQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k4CO6yxeCN+K6jU6ThxjJdMzX0DGgTJ//Rs5+618opEm1W/UMkl51U2wzQUWzLSieCa3Ig4WT7dLS8neSnoMph/9+HEJk/7gyJpycUA7wQHYyE+FI2CVoQNlSQMwNxnJyC8KKpMdj5XX3ck6XTNoz65DZIfAMXmfgXAtstujVzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bqGnlarD; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eOkuwFV4; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bqGnlarD";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eOkuwFV4"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gvCT51H3gzKn7H;
	Mon, 06 Jul 2026 20:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783362313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6dSbBe8D8SlZbGm5NYlJ4nvOYSwjvIyEneEBSZcApDY=;
	b=bqGnlarDUpX8y/ht/BIcDQ9oRpHiwtA4F3IbUyiye5k6JcBQNj1Vz4TqPQSgT8Kw4/NzLB
	NFzOqNAB7Ymal9jjJUM1pTEnNURaf1znGHjncyLsgUn24l8Jq8agCkaxiw4PieSFEzL4sx
	F2VuYfW+qs+SgrHlLpLkwdPxS/pyUauR4DlNsYPO1MrhArQ1VUhOgsuoX1nvRs6345zJIx
	IbLasNfwqb8QJfjvDzP112mTOwF0Ebr8recoaQFsP8QWi5pBhqGXFKMoL/RMP7gXWEK3Vr
	9ckIfwUxNZ7JXZ/zo+ERyrLUr0V27E+IDYXi60mJHWy17hA74gwg1DeYnEfHag==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783362311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6dSbBe8D8SlZbGm5NYlJ4nvOYSwjvIyEneEBSZcApDY=;
	b=eOkuwFV4Rh00KkMFFCEA2D4Kpbsfk/oGa/sEaN5KCZoQ0GliYxA4EgZti3jIH0EsTcU0oa
	vw0qLSGZp5YfQVlxbK3H4gDGG8YZAwTwzWgW1i9wDW2tuT50UGm42ieyvifZUZ5inJte35
	p0I6T3DEH9MGejkxp8/gceyetVca62EWQp9tCXaDExBtk14LTlM694QPeUyuqcTG5HD0s6
	RCu/H1/4tgy9uMGQcjZBFX2riXJHWSHEdVQ8stDdpW4EBexLO+uaXTl5tixloT/EtBs+zT
	w5mJqj8curskpEW83FJTizIE+IsKOcUdE6ZjBDKtC5D2kICGi8UN9+P9GbJSig==
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rajmohan Mani <rajmohan.mani@intel.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: admin-guide: thunderbolt: fix sentence structure
Date: Mon,  6 Jul 2026 20:14:30 +0200
Message-ID: <20260706181429.264791-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d7103e3ad656f128414
X-MBO-RS-META: sw1sis8iopkgco4gnnnxekm7of1jfbsc

Replace ')' with ',' and add 'is' to sentence.

Fixes: 3fb10ea4ce86 ("thunderbolt: Add support for retimer NVM upgrade when there is no link")
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/admin-guide/thunderbolt.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index 91a6cb109988..ff25fe853706 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -294,8 +294,8 @@ for the retimers::
 
 This enumerates and adds the on-board retimers. Now retimer NVM can be
 upgraded in the same way than with cable connected (see previous
-section). However, the retimer is not disconnected as we are offline
-mode) so after writing ``1`` to ``nvm_authenticate`` one should wait for
+section). However, the retimer is not disconnected as we are in offline
+mode, so after writing ``1`` to ``nvm_authenticate`` one should wait for
 5 or more seconds before running rescan again::
 
   # echo 1 > /sys/bus/thunderbolt/devices/0-0/usb4_port1/rescan
-- 
2.54.0

