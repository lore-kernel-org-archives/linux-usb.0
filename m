Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400372;
	b=2RQ1jFtU6kUQvQ3WMNt3qdNkwN4X27VX/oRqyH2k2o3z0y4G1d1QVn3JpsQGjn7Ghc3j
	 cGQaaIxe7tUXCV27GbdyY0+Dscmvp7896tylOtbaAjWK1Jxb2NW6fnKrkLDXj27KPjEUS
	 NG8tsu/HcXVZmjkZU6A9QlDRfizizRg3S87R4v0JUG2VawatB9b4khmvccX4NHvHSKWPq
	 OlePcsRKVZQmXL0Njm46MNA1saOAW0jmEmfMoijBV/trXH59YBW/7ZB9AetNyqUp/PULd
	 4fg/U62BQNi2wdJaVQZdJA7GfEhA6gox6lLWxSWKZZAOoZYeJWG2Nozc3H7XcbdLWKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400372;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RKBYETIMg6QlBapSibcw1sFQ89LN73O0xGZtGC5dmG0=;
	b=XTmfBPoEBvQrZKVHCVZsdcrguLl03kPaarm5IMDTE5mNSXOZ72IUWFBW7iYqcSd0hK5j
	 1pPtSGEoh4euFzqrMv6n9lG6CoTh5wiUVHbDpn60AfxqKUcTWfTvxoSfoo/FrAZqEXlR0
	 9SitDALjoHqJ3pBDbJQcPar2Y6bovzUeIEFMnz6HChYV+1poCe9vvJUyczfccya9c5rI0
	 7FC0cEqqOqq14x6xb/mvxutnMYVnYyxJimg5rY0IobSVRh0+Z/r6PTgznXJAYe3qrE3qR
	 esI5AsH0tcjfDMtq4MZFIkiBiW1rhQyACT3BHwjgD4ymuM05Ydwc2eERT4Ex+pGJxxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JOIpZQKI;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEFB606A327
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EEFB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JOIpZQKI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794400372; x=1825936372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vL0HMEGUHxlMcb0JPg23pHuoagLYvlm43rmgHq8ozh8=;
  b=JOIpZQKIiMBL7XznJ3Ve5/YKHP/LLaJVFz/T6JlMWphscVoOSwE4MmDo
   4VdNec6hNgkTZIH8KRZbRiIYXFxCLkfbgs2DF1147F4DAILtn72uo4c9u
   noVMyEzfBwIx950Rk+eezSMpUWnZHhoWCR7dIbRtAHkfjmut5mUnof/Og
   j3ERmEabzimV9qbo01bwrmf8iuLnWLI1ko9CGryMZJMB8EfqeSaE+UEng
   2NFAaNwLAlPAxKyYoxZXyBC7s1bIi23yrY9GFBoucbLAvuPTxEhjTxuAE
   hKgscGE1F9LTmdGGhdgcl05pCOTXovtvQ3GMOkGURJsxfsfgfk5x+2yiE
   Q==;
X-CSE-ConnectionGUID: hQE9+tHFSeu6aCxlqB71CQ==
X-CSE-MsgGUID: NrKKTU65SailK/wKn21rHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3079253"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3079253"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:32:51 -0800
X-CSE-ConnectionGUID: kt3ec7H8QXyoZCnfy1c0EA==
X-CSE-MsgGUID: vG+KL9ybTbuBNAjX7lygMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8723281"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2026 04:32:50 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 884F19D; Wed, 11 Nov 2026 13:32:48 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: Return -ETIMEDOUT if XDomain peer returns ERROR_NOT_READY
Date: Wed, 11 Nov 2026 13:32:48 +0100
Message-ID: <20261111123248.1312997-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261111123248.1312997-1-mika.westerberg@linux.intel.com>
References: <20261111123248.1312997-1-mika.westerberg@linux.intel.com>
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

The XDomain protocol retries the message when it gets -EAGAIN from the
handler. However, this also happens if the remote peer replies with
ERROR_NOT_READY as tb_xdp_handle_error() also returns -EAGAIN. This can
lead to infinite retry loop. Fix this by returning -ETIMEDOUT in that
case.

Cc: stable@vger.kernel.org
Fixes: 8e1de7042596 ("thunderbolt: Add support for XDomain lane bonding")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 45e26833c953..e5a962537920 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1370,7 +1370,7 @@ static int tb_xdomain_get_uuid(struct tb_xdomain *xd)
 			return -EAGAIN;
 		}
 		dev_dbg(&xd->dev, "failed to read remote UUID\n");
-		return ret;
+		return ret != -EAGAIN ? ret : -ETIMEDOUT;
 	}
 
 	dev_dbg(&xd->dev, "got remote UUID %pUb\n", &uuid);
@@ -1425,7 +1425,7 @@ static int tb_xdomain_get_link_status(struct tb_xdomain *xd)
 			return -EAGAIN;
 		}
 		dev_dbg(&xd->dev, "failed to receive remote link status\n");
-		return ret;
+		return ret != -EAGAIN ? ret : -ETIMEDOUT;
 	}
 
 	dev_dbg(&xd->dev, "remote link supports width %#x speed %#x\n", slw, sls);
@@ -1472,7 +1472,7 @@ static int tb_xdomain_link_state_change(struct tb_xdomain *xd,
 			return -EAGAIN;
 		}
 		dev_err(&xd->dev, "failed request link state change, aborting\n");
-		return ret;
+		return ret != -EAGAIN ? ret : -ETIMEDOUT;
 	}
 
 	dev_dbg(&xd->dev, "received link state change response\n");
@@ -1564,7 +1564,7 @@ static int tb_xdomain_get_properties(struct tb_xdomain *xd)
 		dev_err(&xd->dev, "failed read XDomain properties from %pUb\n",
 			xd->remote_uuid);
 
-		return ret;
+		return ret != -EAGAIN ? ret : -ETIMEDOUT;
 	}
 
 	mutex_lock(&xd->lock);
-- 
2.50.1

