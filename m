Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CE84C77AA;
	Wed, 13 May 2026 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687578; cv=none; b=aH1SCCMnzeN6B9LGnLBWlmX7W2eOobcUav9WybbTAsRvkXxH46CH7RhuidKa6m/woIvMjBN/R2iTXZ7pz7crtd4H9VUpNIGRk8mHkrFwNYQBwJIypNU8uqx+op6UytPkkKIB9D8Q9gFHOT+uk/KSBz2YY7FZLBRIX7rux1rTVAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687578; c=relaxed/simple;
	bh=20oChBYXixeK+PSOHIM3GZOG2DbV62UHeZQJeRm9pBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rucwzdQoCj1wAWWFNqO6KxF/iZBwIb6bmitxpzrWwLtH209C3DeOFLbEn63Dc5Zg75IQCOGK3KJhvC17XJfXJExt7b2gKT0MxxOWO3yGi+wAnxcmzrXxyLVZOtkMOhrcLvP+/fsw6+XvrCvW4hUY9A3GTa5DD7ps8pOMqkT+OCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hEjG7TE7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hEjG7TE7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D752C19425;
	Wed, 13 May 2026 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778687578;
	bh=20oChBYXixeK+PSOHIM3GZOG2DbV62UHeZQJeRm9pBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hEjG7TE7c29pHT4K4dEC95saGApLqs8BiCwrLmAAkhwcaRiZZAdGhCdkf9VfQj08H
	 i6omzNQkhcC0xiYJIEQSVy9XXnYj6iLtT8kPTynMNoeoaj660vnxiMP149Qp4mN3iP
	 iaJOXAGi/SWtyJ6pj8AK5l5z04Z0D8UW2f/7QTbA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	stable <stable@kernel.org>
Subject: [PATCH 4/8] usb: typec: tcpm: validate VDO count in Discover Identity ACK handlers
Date: Wed, 13 May 2026 17:52:51 +0200
Message-ID: <2026051350-plated-salute-0efe@gregkh>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026051347-clustered-deflected-9543@gregkh>
References: <2026051347-clustered-deflected-9543@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=20oChBYXixeK+PSOHIM3GZOG2DbV62UHeZQJeRm9pBY=; b=owGbwMvMwCRo6H6F97bub03G02pJDFks84KUX2+WYS/dczKpg1Mw7qzE7YMN/yWKEpXP/krtb BafYabVEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABMR42eY77dSYOpNcelNnP++ ac1mPH5aWW7/T4YF2/duTnq47jCbi2L6u403ZZWjfJbKAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Properly validate the count passed from a device when calling
svdm_consume_identity() or svdm_consume_identity_sop_prime() as the
device-controlled value could index off of the static arrays, which
could leak data.

Assisted-by: gkh_clanker_t1000
Cc: Badhri Jagan Sridharan <badhri@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 55fee96d3342..44dab6c32c33 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1855,6 +1855,9 @@ static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
 	u32 vdo = p[VDO_INDEX_IDH];
 	u32 product = p[VDO_INDEX_PRODUCT];
 
+	if (cnt <= VDO_INDEX_PRODUCT)
+		return;
+
 	memset(&port->mode_data, 0, sizeof(port->mode_data));
 
 	port->partner_ident.id_header = vdo;
@@ -1875,6 +1878,9 @@ static void svdm_consume_identity_sop_prime(struct tcpm_port *port, const u32 *p
 	u32 product = p[VDO_INDEX_PRODUCT];
 	int svdm_version;
 
+	if (cnt <= VDO_INDEX_CABLE_1)
+		return;
+
 	/*
 	 * Attempt to consume identity only if cable currently is not set
 	 */
@@ -1898,7 +1904,7 @@ static void svdm_consume_identity_sop_prime(struct tcpm_port *port, const u32 *p
 	switch (port->negotiated_rev_prime) {
 	case PD_REV30:
 		port->cable_desc.pd_revision = 0x0300;
-		if (port->cable_desc.active)
+		if (port->cable_desc.active && cnt > VDO_INDEX_CABLE_2)
 			port->cable_ident.vdo[1] = p[VDO_INDEX_CABLE_2];
 		break;
 	case PD_REV20:
-- 
2.54.0

