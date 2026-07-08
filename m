Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABAF4AEEF;
	Wed,  8 Jul 2026 05:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489942; cv=none; b=soPCUcjZo5a3Aorz2zIf3fGFWAFz5FAlQ287d7VkfscOwhrHVhk8AKj/1tr56c8n0m95YS5vA9I/M/D/ChunyXpZaeStj62eGWegUT62LQFv5o/uW3WEir8TACgL5q7mUL8uxSPltPNvbJOKBUKKJybiJFs11wmtNUZRJsbbuVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489942; c=relaxed/simple;
	bh=CRwEQQ/qISZocbLsCftB8CwH1KVxGRXo8oiO3OQSZf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qz2G2CTVRrGZku49mBfVjGqJJP2jKFAbvPrdNuaM+p42J+hR4gHvEobcNo+Ku+NrPQSFG+/iv8Pq1tgBcts9flpurvFK87WnVL9ruOrAOxZK55QwtnVX/8G0XeboB0gWx7AvDJ4G6C3Vp05l3mi9oqlb0QvDbwvQe5+WWkYMRkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X5VC9pdi; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UUoieJkR; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X5VC9pdi";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UUoieJkR"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gw6gQ2xCGzKv7n;
	Wed, 08 Jul 2026 07:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783489938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Sh7udOybOC/7flZrXQSRfzdutb+rjfnQXOZsmasIgY=;
	b=X5VC9pdiT+ZDnWdQPOfD80SAD/QGYvL3ijL1ebz+ip2yAH91DVx/H7bsCmTskiWWYm7hVe
	ttAYEUpgqUe6yTZNcRBgGKA+xOTrXfSpjn9C3Djoalc+EdKVNpS1/tb2TBpUMsXMxRj8it
	lutnygoOHF93budb+XX/6Xreo5Iuyol38BEeaGEFxLBB2m1l6neywF7f4lGS4saidXjflH
	iASxJHlFAkGpqIkXyF/sajYrB8FvsnSFxN8PPA53JdDgbwC/SNOIu5D8BGANR1i52XXx3C
	yFqfS53nsx9UrJ6CcJRkH3JhJzTOp3mX9LBLR5gGzKJ4RVtyN/cw/wLIJrP6qg==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783489936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Sh7udOybOC/7flZrXQSRfzdutb+rjfnQXOZsmasIgY=;
	b=UUoieJkRZExF6WIj1ViTvI2X4DhtVYB9dDkd8f+98ZLh52Dw8igDoE0+JqOwpu1lk3dVIQ
	doOt15iYftUt3WvSgNl9UzXs+HQ/anrCirkqWBEMyvcMyyiCq4bOJHTl3Wx4Gfer7CBYI0
	vVRhOxccHOcYjub6YEdburyC5WB1v9ZDoSeoLxcZK+aOUsCP2rsQExA+XsWn0bhIxiJ/UE
	JTHkXV8EDc8xZnXpaSEbrKa6l3ERH3rattMJFJ7PtSgw0BVIpG5mEfiPlY8OHljMBMp9yu
	ANk/DlFqzolVCepCgGV6xp9iP6J/qLgYtrVz09YkKZFrx1qZNshvcP9SKD+wQQ==
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rajmohan Mani <rajmohan.mani@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: admin-guide: thunderbolt: fix sentence structure
Date: Wed,  8 Jul 2026 07:49:24 +0200
Message-ID: <20260708054923.293003-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d924e20bbbf70659084
X-MBO-RS-META: 71e4hw787rtodazohpir5f19sawt6jps

Replace ')' with ',' and add 'in' to sentence.

Fixes: 3fb10ea4ce86 ("thunderbolt: Add support for retimer NVM upgrade when there is no link")
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
[v2] 
 fix changelog
 add Acked-by Randy
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

