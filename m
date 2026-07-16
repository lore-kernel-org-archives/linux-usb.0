Received: from server.c3server.com (server.c3server.com [62.146.174.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A780332E72F;
	Thu, 16 Jul 2026 20:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.174.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232536; cv=none; b=hyz9xLReJh9HW58a3i9mkKXLktBuTApI4yIBx4wzHlW24jhC2D6sEMjpXTIqnXoLww86gN0Gian8thPpyU/TNgN1ZHaEq/w3D24/ZygCesZ2j2ne7OE6Zrz3seoUbN1L2a7dmsIPyLZTrvzlL3DNZKmqvI+j3N0Wt0Z9POuk2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232536; c=relaxed/simple;
	bh=h+SqBrHv5m4BUG+NOSX70CN5EBP+9gHc83tKbv3Eqr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YxYdEnjdr4DK9SNJ2kDs1Kv6kn3t/0Kb+pPVXTZWlH3AXfzSgRVo6KAivxejpqvAk+KfiJ+PD1pD7HqQZ0Ux0LNAINZuVpnGc2d+WbNhCSpUnztn4g4t/15FRopHRkec6TsePVotBI9huWgA6Vl6LUXYkjJIsNx4grxzquc/X1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cusimano.com; spf=pass smtp.mailfrom=cusimano.com; dkim=pass (2048-bit key) header.d=cusimano.com header.i=@cusimano.com header.b=tWljXkdL; arc=none smtp.client-ip=62.146.174.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cusimano.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cusimano.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cusimano.com header.i=@cusimano.com header.b="tWljXkdL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cusimano.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8J42jkaKB4YPTPJkBWA3h3FqBphCcGwStjUpFB53J+8=; b=tWljXkdLsooTMN8L2J3z9hew1X
	6uoR92msyeQJlgQXPlBfVSpHa9IiN+BUg7qN8TPhkUL6Lh/gzZbzMcfxdMkoJ8Mp9FI+rtd2i1bhq
	wnV4ufwmFA2TDbsO/Tg0u++wXp8pTik1eWUhAwKLNiSJAvokk+Miq7HNQI640IevXUaZUSNKTYpFp
	NxRLPPmSf9l1taauDjwJHCVxNnXwcyZ1y1vv/8tX4B5MV4ub4Gww9fivZulVFFmwQV011fRV2Tmrk
	zVeANTnNRpMM3iz3sgHH9gsC3UYFSAkxjZnMe/M6e/z5z9155OrYb0VvioUHISBiKpSvv5dDOKOdT
	LFFwvZtw==;
Received: from pool-99-241-84-127.cpe.net.cable.rogers.com ([99.241.84.127]:58161 helo=DAVIDCUSIMAF817)
	by server.c3server.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <david@cusimano.com>)
	id 1wkRNL-000000002GN-2LsO;
	Thu, 16 Jul 2026 12:04:03 -0700
From: "David Cusimano" <david@cusimano.com>
To: <linux-usb@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
Subject: [PATCH] usb: storage: make ndecimals unsigned in parse_delay_str()
Date: Thu, 16 Jul 2026 15:04:00 -0400
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAEFiSgvv3ohCnt1JqVKYCoXCgAAAEAAAAJls7O2uSQ9AogvVUySzVk4BAAAAAA==@cusimano.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad0VTx4KMkRo1fR7RUmbAVPpqqEgoA==
Content-Language: en-us
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.c3server.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cusimano.com
X-Get-Message-Sender-Via: server.c3server.com: authenticated_id: david@cusimano.com
X-Authenticated-Sender: server.c3server.com: david@cusimano.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From 73039aaf92449baf12dd4f774164cab4b9987a5c Mon Sep 17 00:00:00 2001
From: David Cusimano <david@cusimano.com>
Date: Thu, 16 Jul 2026 14:04:29 -0400
Subject: [PATCH] usb: storage: make ndecimals unsigned in parse_delay_str()

The ndecimals parameter controls how many decimal places are added when the
expected suffix is missing. It is never used as a signed quantity, so make
it
unsigned to better reflect its intended semantics.

Signed-off-by: David Cusimano <david@cusimano.com>
---
 drivers/usb/storage/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 064c7fc8e..c5bfedce7 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -83,7 +83,7 @@ static unsigned int delay_use = 1 * MSEC_PER_SEC;
  *
  * Returns 0 on success, a negative error code otherwise.
  */
-static int parse_delay_str(const char *str, int ndecimals, const char
*suffix,
+static int parse_delay_str(const char *str, unsigned int ndecimals, const
char *suffix,
            unsigned int *val)
 {
    int n, n2, l;
-- 
2.50.1 (Apple Git-155)

