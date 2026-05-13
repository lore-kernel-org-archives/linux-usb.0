Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637084C9009;
	Wed, 13 May 2026 15:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687581; cv=none; b=VIU/lTmtTYpB/P0f8jNoYM1JzrbI6Rv0uuwM/wuwSejRzwOHF0WxkjHA+aiFAILBpjZnmxnzSL/LBglVMOScqkNFbButLySvNIZJl4B2q/BPytlhlupMb7LFVRj+ZfHgbmbLrZOwgDRoyckqRxpxMHaN24wv6voY25sLLHAWJPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687581; c=relaxed/simple;
	bh=awpI2Y+2Q/pPvN8YSS1Yj9MJGh2jA9AeubJc9wvmj5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHKX1OR8QWz/9SSCnA0ectPB8V3WZBxCGzvnfXA+eRcEvriVZSKBfx85Q5k+OnaAzDRfB45QUxAYkvzjWOCJhAriKSQOLmspDpSIM/1IhM3sEni3V8ngEWbUgMtnUjyMvdrsjabftoizOESqoURcgIFF7f25D8mDEeLR9QmnW+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eF43wFVN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eF43wFVN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1E3C2BCC6;
	Wed, 13 May 2026 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778687581;
	bh=awpI2Y+2Q/pPvN8YSS1Yj9MJGh2jA9AeubJc9wvmj5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eF43wFVNTTrhZpacRrdymH1kj26hj7MPNAlvim69oVqbtM/eAu5snrVeqbT4hAiJO
	 zbKhRqIZdvbJjpN4x7ZZ536weG+meSpPiny0ZdndYLxj1Blwl1HAi6Nb5GPoHVlla8
	 7bqxEBzAoEVZZF9IRXQNx70M1N1iQiW+dEAGQat0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	stable <stable@kernel.org>
Subject: [PATCH 5/8] usb: typec: tcpm: validate VDO count before reading Attention status VDO
Date: Wed, 13 May 2026 17:52:52 +0200
Message-ID: <2026051350-stimulus-cornflake-d7ae@gregkh>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026051347-clustered-deflected-9543@gregkh>
References: <2026051347-clustered-deflected-9543@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=awpI2Y+2Q/pPvN8YSS1Yj9MJGh2jA9AeubJc9wvmj5M=; b=owGbwMvMwCRo6H6F97bub03G02pJDFks84JFfmXFNd9wruPmKHhh0l+z79Na+Uci1zIP3HrOW 9d/YcubjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZiIyhqGBYsnMUkvWssR8GDx kSkfjKaZST4Um8Iw39c0wFGy40a50rq5jcsdFKbf0SlZAQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

A broken/malicious device can send the incorrect count for an attention
status VDO, which will cause the kernel to read uninitialized stack data
and send it off elsewhere.

Fix this up by correctly verifying the count for the attention object.

Assisted-by: gkh_clanker_t1000
Cc: Badhri Jagan Sridharan <badhri@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 44dab6c32c33..2cab74ed71a7 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2639,6 +2639,8 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 			}
 			break;
 		case ADEV_ATTENTION:
+			if (cnt < 2)
+				break;
 			if (typec_altmode_attention(adev, p[1]))
 				tcpm_log(port, "typec_altmode_attention no port partner altmode");
 			break;
-- 
2.54.0

