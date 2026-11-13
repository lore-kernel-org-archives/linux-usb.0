Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538173;
	b=xo6tYvOSzb0vG+pcwcky166bDvbmJ26c+XYkkJ0zic4GseKCxER5wzs4KAXPqXuvMBnM
	 g1xPXOFsPNI04Bq60fE5gF+hCa79TdTkgs3LdcYJvPSagEDMsb2QhjSibFFe65GzTW3bh
	 J7nyb4y0qc69RetYETqPN0DvbS83c01g1GmuBwomwlwGbFy+S33AoRxYN5uOoOIokRMeh
	 BUdYbjESPYoHZm4CjEsZj7wbw5ZyArQKGHbbHyY4QgETplGNh1ptO9lRXeTmYasc5CzfC
	 gkdU9g8uP6DHnAvM7mOgIdx0XtL/XExcfwhEehwbdLzcXdym2czsF7O4CRP6nuEG8tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2bIb6utckDAVVNVMntfTigEadbgFKDZJSoqLLBeE+3I=;
	b=kcFgj44kOTa9nGarvdFBCx7uiqFhLKTsPRSGw4dwn8epSLMyBnpfSD41+YcH4myfNokQ
	 LN2cRvydnc7jWlhBdVVzXWIkekwQdChQMvJ0V4AFBFoitQ8OnRaQABwSJ27XcGHDrYfEt
	 +5eRmkB9pL5IpPdi4pPhted9SFp9N1Dycl4f3JJk+3yB5a9889Cky8vNlOqs0w9fe34wt
	 wSehGwPkEMVykgLc16Jpid3eysBjk7Yv430MTx0TpLQI1j/URMBFgaAEEz1BAcqz7dHUR
	 Bg9B/9xgRbq/sabO9J8V5/MNrGfHMQAGZ8RPM7wqk02Pj9CvheB9zUm8KMsfLaaiQtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B5Y9jRcv;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A7606A8BB
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D2A7606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B5Y9jRcv
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37158b53d06so845859eec.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 18:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794538172; x=1795142972; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bIb6utckDAVVNVMntfTigEadbgFKDZJSoqLLBeE+3I=;
        b=B5Y9jRcvnYhESwdbgUjcg8ov5ov1wIuDYyUmbKT++u8hX91MVPWkdL7Cu9OkLy8Hbw
         JkfS0yhysawtup8SwukK6WqXpLdH1WetRpEdtRwZmAPMFHWzDM6Q3/IsRtXE9rt4UHtS
         wpLVJemf3DsYtQOC3Xlw85I7b2ruGw4Xj5alQxr9sfSo9tdMcQEz2q2CwSh6EykRiqDr
         T4fZS1pTRmae6+bte3NkUH2Dq3ZRYcqVhC4aS2wiFEbyo97jW5Bvh0LpJ0SI1gGnM/DW
         SM5BNWtj6zPIuj+58KlZlTIyONBsbQ+g8fvkP01O+GLDOCEYQv+8iP5zuNbFbENTRfEA
         fCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538172; x=1795142972;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bIb6utckDAVVNVMntfTigEadbgFKDZJSoqLLBeE+3I=;
        b=erom8OI860fxny0B665K8yuxxPCv9nqzr+FCux1lewczG+hOqIBy6uAQXMnnl2ohmd
         OqinXwtkPxTiyBDbobKydiS71S80I1+RghR59iMXFpiKgm/3M+Cfpp/93O2nFkj/cKhy
         mxNfvOFHY+KOH3cqf+Ea/rl1fj4lTKvbYCYPF6Boxht3LHIpu9bhG99bg0Pl0LafxHoy
         H1INYPu8p/JeX7SFQ4b+LP2wfntLMU+rHuym2gNiXGhI7l7MSjvLEVUBHWwSKE5eU2XG
         gU0oqf1o8i4Q5HQ6Qw3ZCDbncxJGyzmbiSq4OO9v8hiZlYgW8WSaNGAn5YvM8PlffVhb
         40yg==
X-Gm-Message-State: APuU4Z9A46LdbgdKGhcEVrwTSXwRlXGLZqXAUniRZOllvI0FugGTAWnE
	pee8PbB0OnMztMB0PEwvx7kWQ3o4Hzp4ldizLHldhOcZnvwPB64Rot2+ymUbVFO55lkzbfIXxp6
	EskUgOlniLLFh0f6cv3BqBNkLZC6CZPLnAypJ8w==
X-Received: from dycue8.prod.google.com ([2002:a05:7300:88:b0:378:1191:3e95])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:4104:b0:36d:dcdb:70c5 with SMTP id 5a478bee46e88-377e15f06femr5624665eec.20.1794538171985;
 Thu, 12 Nov 2026 18:49:31 -0800 (PST)
Date: Thu, 12 Nov 2026 18:49:21 -0800
In-Reply-To: <20261113024922.27977-1-sarthakkukreti@google.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113024922.27977-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113024922.27977-4-sarthakkukreti@google.com>
Subject: [PATCH v2 3/3] scsi: core: do not retry passthrough requests on
 disconnected targets
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

Unlike scsi_decide_disposition(), scsi_check_passthrough() matches
SCMD_FAILURE_RESULT_ANY before checking the host byte and returns
-EAGAIN on DID_NO_CONNECT, DID_BAD_TARGET, and DID_TRANSPORT_FAILFAST.
Callers using SCMD_FAILURE_RESULT_ANY (such as sd_sync_cache())
therefore retry passthrough commands against disconnected targets.

Return 0 from scsi_check_passthrough() when the host byte is
DID_NO_CONNECT, DID_BAD_TARGET, or DID_TRANSPORT_FAILFAST, and update
scsi_lib_test_any_failure().

Fixes: 994724e6b3f0 ("scsi: core: Allow passthrough to request midlayer retries")
Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 drivers/scsi/scsi_lib.c      | 5 +++++
 drivers/scsi/scsi_lib_test.c | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index af27fd3df8d4..fa16a75e810c 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -219,6 +219,11 @@ static int scsi_check_passthrough(struct scsi_cmnd *scmd,
 	if (!scmd->result)
 		return 0;
 
+	if (host_byte(scmd->result) == DID_NO_CONNECT ||
+	    host_byte(scmd->result) == DID_BAD_TARGET ||
+	    host_byte(scmd->result) == DID_TRANSPORT_FAILFAST)
+		return 0;
+
 	if (!failures)
 		return 0;
 
diff --git a/drivers/scsi/scsi_lib_test.c b/drivers/scsi/scsi_lib_test.c
index ae8af0e0047a..aafafe676098 100644
--- a/drivers/scsi/scsi_lib_test.c
+++ b/drivers/scsi/scsi_lib_test.c
@@ -184,8 +184,15 @@ static void scsi_lib_test_any_failure(struct kunit *test)
 
 	/* Match SCMD_FAILURE_RESULT_ANY */
 	failures.failure_definitions = any_failure_defs;
-	sc.result = DID_TRANSPORT_FAILFAST << 16;
+	sc.result = DID_ERROR << 16;
 	KUNIT_EXPECT_EQ(test, -EAGAIN, scsi_check_passthrough(&sc, &failures));
+
+	sc.result = DID_NO_CONNECT << 16;
+	KUNIT_EXPECT_EQ(test, 0, scsi_check_passthrough(&sc, &failures));
+	sc.result = DID_BAD_TARGET << 16;
+	KUNIT_EXPECT_EQ(test, 0, scsi_check_passthrough(&sc, &failures));
+	sc.result = DID_TRANSPORT_FAILFAST << 16;
+	KUNIT_EXPECT_EQ(test, 0, scsi_check_passthrough(&sc, &failures));
 }
 
 static void scsi_lib_test_any_status(struct kunit *test)
-- 
2.56.0.611.g1030f0b940-goog

