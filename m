Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A093BD241
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495270; cv=none; b=lT/FKFep1EGKiG55Gkmt9Z63Qff/5+PgJNbkShYf9shAatgYe6lAfiQRMwtvx78NwQsWsVj489aHdplVAo7KKdvpTnc/wBhRoB8LRrE7fx6hp6FOl+HjSOl4Av4EECf0gWzthyo7d4gSw8RizzIIv59eF48fG+4Lk+8do/GT08I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495270; c=relaxed/simple;
	bh=b86D6PpF9GdQi5foWk4j4O1+BdrZCGKPkfeW4QtLSF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6LwTqziIAPPvlyt/59pJmdbxR17zHVWYAxYmwCvry0ZrXqz+18n0++FqziqmbAaKFZPCipM8OyL8vxzePjYd+fYoE3/4qlEGPcxn4qxBFMCwMRuHuES1OBvsyV1S+EHUAmN1Q2Dj+/8CwsqjXi+nq0sMuyF4WLPRRFo7eF770k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pn4qsjM/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pn4qsjM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778495269; x=1810031269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b86D6PpF9GdQi5foWk4j4O1+BdrZCGKPkfeW4QtLSF8=;
  b=Pn4qsjM/+BbZ0ZJMuxnS7dcVuNKOfn9BxWiqYTQ1D2nei/db+NxUZuSx
   DMb2QbWpIY2axA2DNEIuOapQONHVEapbaNxIPeh+GWfz1jV5c3pSORhuC
   o5xYr1XmEoMLG6jVL5MT1Ny7e/py+qNwKQow6vGMiqOvCWbgPeuaeZSF2
   YXoj2HN18Ce1GDh/1iRUCXneT4ujjy2ZYYpSDqnhrToJPhtvhh8VWlTfw
   rog0K8xTXoROdh4BRwxW4OiVX73Mahvz+D9+NpSjPmyqV3FQrGrXGPGop
   btPSk/wk1wZASxt+47YVZ40t4Ayov9JIxtuIP4r7li7Lqji4yMKGRZlDn
   A==;
X-CSE-ConnectionGUID: 1APM5f42QtyKIyIiPI6xkw==
X-CSE-MsgGUID: h93WIwQBQYS48DS8QleuOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79479065"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79479065"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:27:48 -0700
X-CSE-ConnectionGUID: zE9ngLTYT9ue2UaYRzOyFw==
X-CSE-MsgGUID: Xf4l18d0RuqM24NyHZrmhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234358524"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 11 May 2026 03:27:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9136999; Mon, 11 May 2026 12:27:44 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 02/10] thunderbolt: Add KUnit test for tb_property_merge_dir()
Date: Mon, 11 May 2026 12:27:36 +0200
Message-ID: <20260511102744.1867485-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
References: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes sure it keeps working if we ever need to change it.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/test.c | 82 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index f41fabf15456..fa8bee0ccf8b 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -2975,6 +2975,87 @@ static void tb_test_property_parse_dir_len_underflow(struct kunit *test)
 	tb_property_free_dir(dir);
 }
 
+static void tb_test_property_merge(struct kunit *test)
+{
+	struct tb_property_dir *dir1, *dir2, *dir3;
+	struct tb_property *p;
+	uuid_t uuid;
+	int ret;
+
+	dir1 = tb_property_create_dir(&network_dir_uuid);
+	KUNIT_ASSERT_NOT_NULL(test, dir1);
+	ret = tb_property_add_immediate(dir1, "prtcid", 1);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	ret = tb_property_add_immediate(dir1, "prtcvers", 1);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	ret = tb_property_add_immediate(dir1, "prtcrevs", 0);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	ret = tb_property_add_immediate(dir1, "prtcstns", 0);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	dir2 = tb_property_create_dir(&network_dir_uuid);
+	KUNIT_ASSERT_NOT_NULL(test, dir2);
+	ret = tb_property_add_text(dir2, "descr", "This is text");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	/* This replaces the value in dir1 */
+	ret = tb_property_add_immediate(dir2, "prtcvers", 0x1234);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	uuid_gen(&uuid);
+	dir3 = tb_property_create_dir(&uuid);
+	KUNIT_ASSERT_NOT_NULL(test, dir3);
+	ret = tb_property_add_immediate(dir3, "value0", 0);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	ret = tb_property_add_text(dir3, "value1", "Text value");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	ret = tb_property_add_dir(dir2, "my", dir3);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	ret = tb_property_merge_dir(dir1, dir2, true);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	p = tb_property_get_next(dir1, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, p);
+	KUNIT_ASSERT_STREQ(test, &p->key[0], "prtcid");
+	KUNIT_ASSERT_EQ(test, p->type, TB_PROPERTY_TYPE_VALUE);
+	KUNIT_ASSERT_EQ(test, p->length, 1);
+	KUNIT_ASSERT_EQ(test, p->value.immediate, 1);
+	p = tb_property_get_next(dir1, p);
+	KUNIT_ASSERT_NOT_NULL(test, p);
+	KUNIT_ASSERT_STREQ(test, &p->key[0], "prtcvers");
+	KUNIT_ASSERT_EQ(test, p->type, TB_PROPERTY_TYPE_VALUE);
+	KUNIT_ASSERT_EQ(test, p->length, 1);
+	KUNIT_ASSERT_EQ(test, p->value.immediate, 0x1234);
+	p = tb_property_get_next(dir1, p);
+	KUNIT_ASSERT_NOT_NULL(test, p);
+	KUNIT_ASSERT_STREQ(test, &p->key[0], "prtcrevs");
+	KUNIT_ASSERT_EQ(test, p->type, TB_PROPERTY_TYPE_VALUE);
+	KUNIT_ASSERT_EQ(test, p->length, 1);
+	KUNIT_ASSERT_EQ(test, p->value.immediate, 0);
+	p = tb_property_get_next(dir1, p);
+	KUNIT_ASSERT_NOT_NULL(test, p);
+	KUNIT_ASSERT_STREQ(test, &p->key[0], "prtcstns");
+	KUNIT_ASSERT_EQ(test, p->type, TB_PROPERTY_TYPE_VALUE);
+	KUNIT_ASSERT_EQ(test, p->length, 1);
+	KUNIT_ASSERT_EQ(test, p->value.immediate, 0);
+	p = tb_property_get_next(dir1, p);
+	KUNIT_ASSERT_NOT_NULL(test, p);
+	KUNIT_ASSERT_STREQ(test, &p->key[0], "descr");
+	KUNIT_ASSERT_EQ(test, p->type, TB_PROPERTY_TYPE_TEXT);
+	KUNIT_ASSERT_EQ(test, p->length, 4);
+	KUNIT_ASSERT_STREQ(test, p->value.text, "This is text");
+	p = tb_property_get_next(dir1, p);
+	KUNIT_ASSERT_NOT_NULL(test, p);
+	KUNIT_ASSERT_STREQ(test, &p->key[0], "my");
+	KUNIT_ASSERT_EQ(test, p->type, TB_PROPERTY_TYPE_DIRECTORY);
+	compare_dirs(test, p->value.dir, dir3);
+	p = tb_property_get_next(dir1, p);
+	KUNIT_ASSERT_NULL(test, p);
+
+	tb_property_free_dir(dir2);
+	tb_property_free_dir(dir1);
+}
+
 static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_property_parse_u32_wrap),
 	KUNIT_CASE(tb_test_property_parse_recursion),
@@ -3018,6 +3099,7 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_property_parse),
 	KUNIT_CASE(tb_test_property_format),
 	KUNIT_CASE(tb_test_property_copy),
+	KUNIT_CASE(tb_test_property_merge),
 	{ }
 };
 
-- 
2.50.1

