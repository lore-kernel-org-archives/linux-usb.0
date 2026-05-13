Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6544968E2;
	Wed, 13 May 2026 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687568; cv=none; b=nBrPFUvGcMqJPsTnir2scZ5yA8S5Fh+qe1DDegY83h98dOOwuLlallBZCrSwMuxA2YW5tYQGWmLJclC72YXsMCXSUmmh28VWsO5xfS3R4JeTa0KG0LMsULP3NpiaqtHxFo/f8QxbLKECXCU4O5voxvWyq1bhPlL0QXn16HiQweI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687568; c=relaxed/simple;
	bh=icC73uTIJQ2W3R+lBuZqMpTZRyg9DzCMbEDIos+oIJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0EIFZCXyPhxdXjm0S9QysI68DhkT2O+5aKSL8zcSUBvSOyZybqXabY36MehrV0M5vuynOpbrN+r+/a9FRz+M+d25VZ90KghAyc43r/kAhFxzGQJWAkrm4Ya+2qtsDZw6P9jdoAgOKNImnKiejtfOU/TfVyMVBEEAnAJrfFpz+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PlMJNdOv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PlMJNdOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2195C19425;
	Wed, 13 May 2026 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778687568;
	bh=icC73uTIJQ2W3R+lBuZqMpTZRyg9DzCMbEDIos+oIJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PlMJNdOvSLB02igv0WFOAOirD1404r3VRCVuX4p0HxnoNClLuhsZ8vEVOnNEGmHli
	 6C686NrOKDz00pLGhXvjbzRFG0TICi+9Q4aB2zs4emWSbGJ1N1SHs6uXeYjGIg+f4V
	 2d1Xw4v6unbbydVji6F+oNCfvYhIoj1+y+lOnLEw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	stable <stable@kernel.org>
Subject: [PATCH 2/8] usb: typec: altmodes/displayport: validate count before reading Status Update VDO
Date: Wed, 13 May 2026 17:52:49 +0200
Message-ID: <2026051350-reacquire-sculpture-4244@gregkh>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026051347-clustered-deflected-9543@gregkh>
References: <2026051347-clustered-deflected-9543@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=icC73uTIJQ2W3R+lBuZqMpTZRyg9DzCMbEDIos+oIJw=; b=owGbwMvMwCRo6H6F97bub03G02pJDFks84JCghpN5/nNEP1a7WqUYbxghWhr77quwnc1gSrLf 72ctiagI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACbicYhhDt8U3QrBp7dCUssq zi37F7GqUTiAj2GeumuQ5Hsjp2tVW0P++Olsj9NfGN0BAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

A broken/malicious device can send the incorrect count for a status
update VDO, which will cause the kernel to read uninitialized stack data
and send it off elsewhere.

Fix this up by correctly verifying the count for the update object.

Assisted-by: gkh_clanker_t1000
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/altmodes/displayport.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 35d9c3086990..263a89c5f324 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -405,6 +405,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 				dp->state = DP_STATE_EXIT_PRIME;
 			break;
 		case DP_CMD_STATUS_UPDATE:
+			if (count < 2)
+				break;
 			dp->data.status = *vdo;
 			ret = dp_altmode_status_update(dp);
 			break;
-- 
2.54.0

