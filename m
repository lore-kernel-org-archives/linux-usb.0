Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620670;
	b=qR/VD8Z/HpDc7vAfB/j5x3d0f+wmbMA5LB6Cjg5hbn9tZw5h2S1JQmdPFZpp59Pa4eTO
	 Azz4izivxd/aOHuVit8CdzYEiLs2mVzBTEuN3A71qB7YwXqAgH2fG+h6eI5sEBbuf5lRF
	 P0k/NgBOhqOWmDwAfmEWxyO0AVR3nn5pNzbW/SKzpZjy0e9Qw/MQUL20TQiW6BPqY2V1q
	 AuR20d5wbtJvoOWxwp9SRjnGKxo+YyoMXEC3swoTajTVmkFBQBECCEs2qCZ7Q4CsajM0D
	 QGHdqFSo3It/tAbwCqCnpbQeFOlFurFa78WlAHSfxTFM24B2ifJfDBzAkYbXyzhn38Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620670;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EVqBCSfWozpQvthBsRYu9jEmopJbwLUi85RelVf6gwI=;
	b=R3FS0ZI4+XO/e3vTnG92rS1/+BGeuUyt5F57QVwxtB8UqDDkQXFK/9AO0N9ixtGln3t1
	 7ShDKhhswfUQIhCeR2qMVwnoNLl+LHA4QLBsX1gXtjEzkfhGkNi+1/rjQgx59fkiLEc1c
	 IBnpsMAO6siWb5/AhM8+QVlJRveNTeU1xqDfAJUOsVKIAOWEcyc0vAH5td5miRAQ2DDrH
	 WU7OP8tb3ISbIorUrfv/FdcBUGY7izvg3E4ZCtWUX3rD5M0G/8Z3UBMG14PotTavQWwyP
	 AFkHE9nlBSSYfSAy0IGSLYq3B7ODdv+q04gzgCbrB8CXbsCjhED/e1GT3wYCJDQyviQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K6bvbnxx;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26899606A32A
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26899606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K6bvbnxx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795620670; x=1827156670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wicxvZMuETv20LdlcF8DngMLdYW2Wn6rr2CQT+Oe4vk=;
  b=K6bvbnxx+O5zDICXE/SxWgNHNRRCZnJAzgK1WnQgdoZxq6Xijh02YGik
   WflryYbYaU77m+5FG3vlH4MMvpxMzAeTH0JQqTOt7Bd3pYY16oyo7x+Tq
   FHHTa5ltH602luOg5pBoJ0XxANf4YXHEKRdIGt5CaDDI5b4d3ikzgVf9/
   n3f8ZUDZUWK8aRQkEWTx0yHeNLhY3a6XlKdBu2ve6hxWMG2hEExbENVqD
   FNeITHxDEX5pcZlpEXX3KQkBvmQTMAvkqBgggb/ndyaX7Bdm6fvj61Ive
   5BtI3TbzHnFsZq/WM5EvoAtMpsjuELRu2eGWct+1M5drjAyh/aic8bpLe
   w==;
X-CSE-ConnectionGUID: KZv0M/GNQO2Gr/aqtvCtWg==
X-CSE-MsgGUID: hKPHi3LtT+i7qDY/tIHqKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4408233"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4408233"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:26:27 -0800
X-CSE-ConnectionGUID: //qdYGwWSzS3N26yBg6jRQ==
X-CSE-MsgGUID: e90o+KBySqy4KO6LVAvQbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13938534"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 25 Nov 2026 07:26:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 12884A1; Wed, 25 Nov 2026 16:26:23 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH 4/9] thunderbolt: stream: Validate the ConfigFS group name more strictly
Date: Wed, 25 Nov 2026 16:26:17 +0100
Message-ID: <20261125152623.456054-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261125152623.456054-1-mika.westerberg@linux.intel.com>
References: <20261125152623.456054-1-mika.westerberg@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mika Westerberg (Intel)" <westeri@kernel.org>

The ConfigFS group names must match the Thunderbolt service names so
passing something like "0-1.0a" will not match any service but it is
accepted at the moment. Make this more strict. We are going to need
this also later in the series when we introduce USB4STREAM coupling.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/stream.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index 2b73f585ccff..2661f563b99c 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -1763,16 +1763,24 @@ static const struct config_item_type tbstream_dev_group_type = {
 	.ct_item_ops = &tbstream_item_ops,
 };
 
+static bool tbstream_valid_service_name(const char *name)
+{
+	unsigned int domain, index;
+	int len = 0;
+	u64 route;
+
+	if (sscanf(name, "%u-%llx.%u%n", &domain, &route, &index, &len) != 3)
+		return false;
+	return len == strlen(name);
+}
+
 static struct config_group *
 tbstream_make_group(struct config_group *group, const char *name)
 {
 	struct tbstream_group *sg;
 	struct tbstream *stream;
-	int domain, index;
-	u64 route;
 
-	/* Make sure the format is correct */
-	if (sscanf(name, "%u-%llx.%u", &domain, &route, &index) != 3)
+	if (!tbstream_valid_service_name(name))
 		return ERR_PTR(-EINVAL);
 
 	sg = kzalloc_obj(*sg);
-- 
2.50.1

