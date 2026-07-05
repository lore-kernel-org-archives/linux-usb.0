Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B31F17A2FB;
	Sun,  5 Jul 2026 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783234761; cv=none; b=N6gI0qCDQKIxVqkha47YoQXZshOIlry3X/bjUU1j/lMruWPP3Bh8JrjyoQMADzm/xXfSE0AsMBNSBOklp20Bxq1gPkBUzYEiNm5s5FVN2sTBHWivrFMOa/8SXMDJQ2blatdrjL3Uh/ih1Fgl5B95eNixyfUCf80Ka8ycBudwf+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783234761; c=relaxed/simple;
	bh=EWNYmxLvu+gvO/FkQAicTT2S3cWJPPRTPMMsoDU0y+4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rOppQOS2W607tNM7zwchNN8ittbSDp37CGz8rBcPPJCMuTAPSvzSv5fOCWVAOB3KZDealdLOPLm3ZhtmBuE0zyjv3fn1O2nCyzq0gMbsfAh4njHXJhortaoeFe4+YZKHnUqhHQgo720C2uYxgonR7MPg5UF5nt2oxnA88+Loh5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=XGCAF3F+; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="XGCAF3F+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1783234728;
	bh=pBnzib0MKPreOtiekeXOHQ04vZ+ZLT0aAh4MZztz4xU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=XGCAF3F+CKjIFwVjHVA8uGyOoBhmEVON93KYxjuwcHupsrk/o7kpgCF9mcfn4DAwh
	 Hwp8bvvxrkGUhErVKFBcGufY968zSlv22gCmntTaCi6WCcLfJUr2+qUJKI/aGedII8
	 uciLIBUsHo+h3+x2CfZv3oAOTMa202oHyd9rT/Pk=
X-QQ-mid: zesmtpgz8t1783234726t747ba3ea
X-QQ-Originating-IP: 9WTDowsN11vKzlyDh/6Y/wAkSUSxAOSiKAf3bfvV0mc=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 05 Jul 2026 14:58:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18388864747546797149
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julian Braha <julianbraha@gmail.com>,
	Xu Yang <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v2] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for TYPEC_DP_ALTMODE
Date: Sun,  5 Jul 2026 14:58:32 +0800
Message-Id: <20260705065832.184-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M3ZkD08p3wd5otlmwWftN6t5ba26FGpEuDE3lAeAJqQfEixiCRSAkk7p
	oPJF4TWKY+NZx/lF756/LeKptwC3pLeYFxs/cZb/P4AT2nBs+64qZ24YskqwNjTyUJEL8RR
	cfXUQglU3dAStoFM5z/yvcoBcWm+2MKKCQAu8iToLrpLV6anE3YfGfD9FKUJzks6HmqnChj
	raCu7SChRXB3ZQZhkf5NsljsOuwcsBYwe1gdx/Fn/lFP4iwW4K3rT7dRmZ7hhlvvXenpw1I
	I5vP8cQdjVFvhYKSxoOjiTN+bq4IG79FuWM3886yzuRLX/9JgbbLcXrXIPMyAr5r6ZxzT66
	UWzYoUiuBn31sitL+2wtLrDi07u+cNlUhUK0mahZDG3wIiFE1FGXFq/PzJJqn3QVWOXEYsa
	sB+v4t4fdG0M3uRKEFvHRSronAH75hIpH/zuDwjR7wBnQs9vwZ1IpEwmW9l8CerbjbA4XFI
	ssICWkjormpoIW1Z7FsLmItMFRUhjcQun0ORVoiq/vRGNaR5huo91XEE7XS/nPFOObqzkto
	5UvDODOIFtjbbarCRCrBrvT7A+gE3vDMOs02NrSp8owmt7cn9HJA2Ip5671JxJFGCVm36oa
	AcOjoGRJ28/+NWEkSG9FSPWjEDUr3AWwmY3zQ6h6FhaDPVylgTM89gJFUxd35X1Q2j7FgPR
	3gUM/qSJ4IycPnTwNLI7qkdUmc7LbWhgK3fViVsOHAKPbVVjMpIn/H8GImWxlz3cjjS/Yt3
	axQckRRFsOfhTdx5+t5fdQJEHBdid/nlQDZjzhKq6K0yXHUXSq8qGtE9Z1p6dZVBZFogmbl
	xyrnpaRkKBC2NSfXFdoYgWjwMBdEG1i7YLPgFLAMD5Vh1Ot6b/BNVuhHXYHbtSpvhiCARA/
	G2BuzjpGT9ELy4f8FWBITuUIhLtJcU4hGssDuWfiwJvSBc1m2onTfQWq5o46WfaKlTh/o0r
	X4IPiD6HlViIp3yfi6ij7O3g6uEDp1DsTsNaAUwY6f88VwVfsbPieCjY7
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

When TYPEC_DP_ALTMODE is enabled, DRM_AUX_HPD_BRIDGE is most likely
also needed for embedded platforms. Select it when available.

Suggested-by: Xu Yang <xu.yang_2@oss.nxp.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/usb/typec/altmodes/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
index 7867fa7c405d..1f35b253d6b8 100644
--- a/drivers/usb/typec/altmodes/Kconfig
+++ b/drivers/usb/typec/altmodes/Kconfig
@@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
 config TYPEC_DP_ALTMODE
 	tristate "DisplayPort Alternate Mode driver"
 	depends on DRM
+	imply DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	help
 	  DisplayPort USB Type-C Alternate Mode allows DisplayPort
 	  displays and adapters to be attached to the USB Type-C
-- 
2.53.0

