Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E2395AD6
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 12:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589017; cv=none; b=St1HwpBztb8fKExZ2aWM5va8IgH0nY9A0yFCPE/33EePVE1nc+EDysZ7lgJNjkJJkhJNWndBxGjrsQ6eckb3KhRPLcPK8FfxJgWev+jXd0aOXQw6Vig94DkvOlpThY9r79QNqcM7VRoqSUFHBvtxlpOfWXJIGoje6idjPF4enl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589017; c=relaxed/simple;
	bh=rb7KCOnpVwX06eQ+syyZaPSxvMH8p6awcjmQwIASAag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vt0Qs3UiU7HdbXbevD5L4WpmYnMj29bt6VLXPTURnpkqtMaCL0ZVI29+wtBMPX12sim9M1dPb/FO4VXRr60MhR3RR9MY0BgTsk81u40O/H0FOlPBgg9FSYjHzKGj1n5LY0dDkym3sCj1dT4MNuevlKaf4C3U70okISZBBGC7ueA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3cXJbBW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3cXJbBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589013; x=1810125013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rb7KCOnpVwX06eQ+syyZaPSxvMH8p6awcjmQwIASAag=;
  b=W3cXJbBWepeEbetNJoUJyqtxCpi5qD0syqUBW1w2f8P6+fpj7YVzKyp2
   YR9+cTD2xqYTBRnSz79Kh3f5C4WXsAh19L6TBgzpI7Vj1q63rGuzATNdT
   /ltAjPBjl40jLFEpNMW+rxsb7tAjKiNCVaZPl6eRHkYOEGFkSIwX52k+X
   0P+SUOoBL0I8CYvBoCknE1yrQ1D3PIQ0AJiJsZv7wXBYHPpsxsqZKqsKK
   FcWBpAouHy57lE+sNm7DDawP18+ZPRzMZfV6HXLIGiGWvHr30GjuPf3LC
   kTUyNyMiydvKAEgdVpMuH2qfjpgtvB8O2IhFNZYI0Cx1D3JuHUdoJlgma
   Q==;
X-CSE-ConnectionGUID: O7YMeSw+Q0mfFXPGSBapZw==
X-CSE-MsgGUID: +6+ee41MSI62IUoQDRBmrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950594"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104950594"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:29:59 -0700
X-CSE-ConnectionGUID: c5b1g4V8SCmihbBLTellHw==
X-CSE-MsgGUID: R7GKhmhfQWS/qjBkHwKg+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="234692669"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 05:29:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B783795; Tue, 12 May 2026 14:29:55 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/8] thunderbolt: Improve multi-display DisplayPort tunnel allocation
Date: Tue, 12 May 2026 14:29:48 +0200
Message-ID: <20260512122955.271688-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
References: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

When 3 monitors are connected through Thunderbolt dock to the system at
once, one of the monitors might fail to establish DisplayPort tunnel.
This happens during DP bandwidth negotiation - each monitor takes
maximum bandwidth that is supported and there might not be enough for
3rd display. In this case Thunderbolt driver drops DP tunnel and
'forgets' about it but with DP bandwidth allocation mode, that comes in
later, some bandwidth might be freed.

Make Thunderbolt driver check again if DP tunnel can be established
after DP bandwidth consumption changed.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index a9d26a2ec259..72a0dd27937e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2849,6 +2849,9 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 
 		/* Update other clients about the allocation change */
 		tb_recalc_estimated_bandwidth(tb);
+
+		tb_dbg(tb, "checking if more DP tunnels can be established now\n");
+		tb_tunnel_dp(tb);
 	}
 
 put_sw:
-- 
2.50.1

