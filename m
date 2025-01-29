Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842B41B6525;
	Wed, 29 Jan 2025 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738148187; cv=none; b=SRuoA7qXKTpULiTUZkhxznFviewV2/POWMk7uw41H2/OTVOoFUG5PSDcWYq+JnzSzSxws3IYABNzYQ3c9JnqJRHJjlvGtm1uDjMzsg56iwiJRsp0AjEYzfFVjxjParGiwzd8R4UDBKzBdEOb8ub5uUjkrEUm2+1lrq3c6y9A8wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738148187; c=relaxed/simple;
	bh=ZbfDEAGGRcoowrUfu5EDqO266YEpTTycz1vMlF9U2TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DsrsiS+1TA5Pxicu5zgIiWf/BnPWevL1gAZA+fNKMOq79PrB5MjcQ5ovxUBqiMXdU39R7kpNStQKpu7zjkDx8gbYwsk71C9XbTJ8cF1ZwryuvCMi9cOOyd1nVoUxLXEhkqKzf97xU4ysnxKQ5w6/2QCe97DfjdvdTbZ1rtJNXLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=agYTMqE1; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="agYTMqE1"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1FF7FF80A;
	Wed, 29 Jan 2025 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738148178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eG2+4hA9d7BGbB5uoMrFvtObkrA1624sPDDaskGyR5A=;
	b=agYTMqE1Rufvd0KeF9wN1a+JQqjozJXoQ9z3tFfN+gnkpASeB4jxUeDGOla9GGqqxKMk5T
	1e+foz1U5PKKQPf24MjQa9oH0eGsfQLGqZXkg7fPOqQNhb3ZbqUlKf8lXu5rB3BosnT1sC
	AdV5jUdhCaxd2TzMXGvivbZMZQFvS0b/JO3xfrXpwUHnnfT/d8umA6trHXKBO2lfnspbGi
	3TXiAwWa/ZXAxN68utX6toA5k3WjhesO4WbGWyqNBl5/wttJmZ0xAfzqRZg1HZgWmXsA1K
	/XYU97ptbytSGVNV0rPLwL2RgPDqcHt+ndSH3yTqWGHG6QNJ8HVmRHt1bVNSDw==
From: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
To: theo.lebrun@bootlin.com,
	mathias.nyman@linux.intel.com
Cc: rogerq@kernel.org,
	peter.chen@kernel.org,
	pawell@cadence.com,
	gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	gregory.clement@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] usb: cdns3: call cdns_power_is_lost() only once in cdns_resume()
Date: Wed, 29 Jan 2025 11:56:10 +0100
Message-ID: <20250129105613.403923-6-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com>
References: <D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: theo.lebrun@bootlin.com

cdns_power_is_lost() does a register read.
Call it only once rather than twice.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 465e9267b49c..799987c88960 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -524,11 +524,12 @@ EXPORT_SYMBOL_GPL(cdns_suspend);
 
 int cdns_resume(struct cdns *cdns)
 {
+	bool power_lost = cdns_power_is_lost(cdns);
 	enum usb_role real_role;
 	bool role_changed = false;
 	int ret = 0;
 
-	if (cdns_power_is_lost(cdns)) {
+	if (power_lost) {
 		if (cdns->role_sw) {
 			cdns->role = cdns_role_get(cdns->role_sw);
 		} else {
@@ -553,7 +554,7 @@ int cdns_resume(struct cdns *cdns)
 	}
 
 	if (cdns->roles[cdns->role]->resume)
-		cdns->roles[cdns->role]->resume(cdns, cdns_power_is_lost(cdns));
+		cdns->roles[cdns->role]->resume(cdns, power_lost);
 
 	return 0;
 }
-- 
2.48.1

