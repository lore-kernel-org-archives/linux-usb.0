Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5DD35DA6A;
	Tue, 14 Jul 2026 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784019887; cv=none; b=NjrTlFvh0DJvDzMUXzAw14xtQiysS+lyRgIVN/Aw3W9xfKXu9gGII6N7jxLJt/jeXHMHX+7ZEGKli2kCuSXfB/wFCWPbaT50MJHw5GfFoXsmQdPhmzxSZaiQO6PzAUhAmGwIgJEvT6T+hFzKIfXfv2mOWgneWJ7/Hhv7poA9co8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784019887; c=relaxed/simple;
	bh=ylzHjsLzK6cMZGsKY08p6FMxVHIa+S2aRrwI9Ece4/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KxzraVkRdjD7hf20t2BNGgBV81J94kC9sRn750lg3TjdWWlQZg5kV5hySZ7+sRhMiZ3QjbIysE+NcYORB0TyVx773NdnjwBbTVkV/HamHfSuYpeLdI0WudyLFZT67BXCNXBo+LC4TAppGy0+5ZTu+srEji2LeOmD5oskdmL7oXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=ZBAcl8pf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l7im9idv; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="ZBAcl8pf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l7im9idv"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9ECCD7A0088;
	Tue, 14 Jul 2026 05:04:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 14 Jul 2026 05:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1784019884; x=1784106284; bh=2s
	LSVYI03CpTXilUYn0RpctehYGq0LsCKn4y0t2Uok4=; b=ZBAcl8pf1pQIodPRlC
	9Lj2K32t79FA2jwBRlRRtv8HLXM+rvXQps+pxbeK6JvRBV6LmtIfgp3vqCjZUbC3
	gIaSSwOJplbGYM0XJ57UQ+f3CH1OlgnaJcMIt01TUWCdo2zHaAnM6CBJ0NuOiURb
	xVWK3kaVBRSL3yvaKkOVP31kcJvoKwL4nrT2yXRg7sTYiqt70ORrKR3yIaC/CdHI
	0DBoJFon54Eo/9HeDt3hpItvKLybQyfg3iuSOIamEZc1J05bTBK0EsBAEgsN72vZ
	MiyuMLS7+wGrTxPrQiFn4MOdrrOSDBGX+PXBZK9ENFNEA+6MkN6epTkW3Vz2sxZF
	Y2pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1784019884; x=1784106284; bh=2sLSVYI03CpTXilUYn0RpctehYGq
	0LsCKn4y0t2Uok4=; b=l7im9idvSLDTpvsA7ZQanAKem7reWWXBAHEhvnSMQUaT
	yrkLH+EAYbUWypUoTDBkeV+rwisSNFnU6khTsedoLux7QD1AIS7OUifFle581ouR
	pDVBfS+7BQF6tWo5n4bQuTTUjNkWDi34BjmeGjpplcQzPO1rbB0bBzEgdFkEYA1Z
	Y6W5oq6ol2y9+lIjQAKhAov3IOKQtUYXB2U88S00YcfI9kmnpzte8rqxsjJo/scd
	NPqPmroLvHctM//jWoCWxJEbMFDzs+QA4V7sAabNlSw7iEscBr20pY6KGSWflxpy
	1VbZXhyRwX0qsD4CHXCNagy8v4XBeuzBxVsD0idNwA==
X-ME-Sender: <xms:rPtVahsGZxRsePGTs_0a3jrwDNkfipI18TLhQuyl4L88Cv_mzQMLOg>
    <xme:rPtVaoTpXSOP_t9Xn7qZmK-PEnyYJ6NTam00Y4F3NGI_K9C3f7nAE5de2xGap9ZNm
    SK5lpuCbOScNhml5opl6kGCKFm4LJk6RXujVQiPcqNvoSCywvI>
X-ME-Received: <xmr:rPtVavM6utmB__IMWU8DaeFqII-ASGKHXiRgDUuQFJYGP4un--bdyiNJHEECwuq9Zl99I6sJiDy_P2vPMuhZ8QQYJflSPrEgVQ>
X-ME-Proxy-Cause: dmFkZTGWt2kMDcT9Ml0yZk7g3SeR7ghelk+LeHnGVdfLCDaVSYOyu4phwe/acRdeqkQ7mt
    C7BOOOyGSPpF/bo9+Czsgp9ve3SbAF1hanEUJQ8DQcvPhpCzn081TDR9vWB4Tg1g5IBt2/
    YjBs7bnk1SpOGJMn2zDZtCHYwuXEYEHzdw8c0oxaKzT+4HErUYWgQf0CgcqrLtY3tVogfV
    m6+TJM7JZcaCqWIpQ749EnG3/D64J+KWUdq9Jn+z/WA4zExnIPRCvY7cuYKdSlV7Nr3INi
    yB+c1Xent9/yV0ezLSfzW9Z9W8z79h5z45qTacAg1l8NgkFu8XUSaDeEpLRWV9zGdYPrMO
    UTec3JoBz1GK0CSU+j1ACvMkI1zIVVAyaUiwWp717gtPj0zDkoW1SglJt4nqrPZvHCHbCv
    nB2FqkjW7SMFrgekEhQlHzjsPt/AP8CCDu+BcQ93Qk9/yDVuqe9UkNRPR9Cr4iFhUhcASt
    wZxflTdSxT1myzhfymj9Veqeom6zkXpB9m9GNK0BcpfO3NmHiib4xzs+zl41RcMZ91yR47
    Eah0c2LxXgvGaJOWLSv9LVxVQ6DwN5AiCqXufQc+OR+S1RDiQP2ldEol9n0GOBzAESnQXN
    Niu9Ra2tQUV8BcP5WeMsWSF/fYjg6H6u8qg9+tlpAautY5KNynr7Ecz9iOEA
X-ME-Proxy: <xmx:rPtVala522W_9FZnn_CoJBOKE9uKt-ZJuNZLXMdjyhc7PWcyeNeKAQ>
    <xmx:rPtVahxBRL7ZwrJIlelZtiTi-_15wFXY9c8EBzUCuAzApArEHu67Bw>
    <xmx:rPtVaoLHi75UxGg7KnbKB9XY5cQtjcCEpGFafaKi9s1rskuMlSZntw>
    <xmx:rPtVajpRrQHqx-0K2cZae54nezYAQRSa81C-kbCWCleYa-rrpIGVeA>
    <xmx:rPtVakpKnGdDTHkYkSieE4e8ZV7lo78XHkTvkXeQ6PocH708JbBqu4xv>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 05:04:43 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Tue, 14 Jul 2026 11:04:33 +0200
Subject: [PATCH] usb: core: Strengthen error handling in hub_hub_status()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-usb_core_patches_2-v1-1-4229a368a633@kroah.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrA2YVCr2KkVCJv7qdKGS0VIQ7
 97ULr/FewcpkkDpURyU8BaVZc6wZUFxCvMII302ucrdq8bWZlf2cUnwa9jiBPXOhBu47S033IJ
 yuCYM8rmmz+5v3fmFuP1OdJ5f7A7G7HYAAAA=
X-Change-ID: 20260714-usb_core_patches_2-a3eb9d1b7b9e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784019882; l=1449;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=ylzHjsLzK6cMZGsKY08p6FMxVHIa+S2aRrwI9Ece4/M=;
 b=bbmDMFSg9KXFxmpP8eY/nYCM6LVPsZaZErXemXAcQ7ROeUWs4uPXfE8J8G12yn0VhYBrfPFnq
 Rbs1QjLZ/5yAr9WGmBoM9HrStERn4n+yIZKa6HqNGwG14/3I6i25PGd
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Add additional error handling after the call to get_hub_status() in
hub_hub_status().

get_hub_status() uses usb_control_msg() which does not verify that the
message is the correct length, substituting it for
usb_control_msg_recv() would also solve this issue but increase memory
allocations.

Instead, error handling is copied from the method used in
hub_ext_port_status(), which shares the same flow of logic as
hub_hub_status().

Assisted-by: gkh_clanker_t1000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/core/hub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..0d2166b8923a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -991,10 +991,12 @@ static int hub_hub_status(struct usb_hub *hub,
 
 	mutex_lock(&hub->status_mutex);
 	ret = get_hub_status(hub->hdev, &hub->status->hub);
-	if (ret < 0) {
+	if (ret < sizeof(hub->status->hub)) {
 		if (ret != -ENODEV)
 			dev_err(hub->intfdev,
 				"%s failed (err = %d)\n", __func__, ret);
+		if (ret >= 0)
+			ret = -EIO;
 	} else {
 		*status = le16_to_cpu(hub->status->hub.wHubStatus);
 		*change = le16_to_cpu(hub->status->hub.wHubChange);

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260714-usb_core_patches_2-a3eb9d1b7b9e

Best regards,
--  
Griffin Kroah-Hartman <griffin@kroah.com>

