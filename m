Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD2F3F23D9;
	Mon, 20 Jul 2026 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557481; cv=none; b=EDuQmEV8SJjzQl2wxKrrQqS9m0yUqBqgxiaLCsg++3wAriu16Ce2KnlwM0aSWgISx6abiqmsH77rJCGJJrcAuRUoDfjRQLbovEkeR8ahadhYt5+PWEHD1xnN81m82HkLkPHTEzJP/X13XYG8Hr5DgUA/tRgxq0fGM3L9XX1+6ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557481; c=relaxed/simple;
	bh=EBv9hdZzy8sLi7RS2MP7wqNk8Cd4skOw5v4EClZ7yuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ainlQOJPTYGxbulNBGy+fHpl86PDz4WMEFKhutj455EDhYvL+kvwDoG/P8R/WExa2xlxnp3/EXCDn2LQF3apX4k5YzgQgQfodL+GIkRO6wznJGaoIH1Y35hmsxogZYr1oBd53Oi3aWS1+gslv0gWkZ2r+5uyBvFliZ5KpfU4zBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AG7Pn3SY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AG7Pn3SY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F4F1F000E9;
	Mon, 20 Jul 2026 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784557479;
	bh=tM2X5HCQL/Vc1XqYIigSIWUX0BJEdllABu1QVOyAUYk=;
	h=From:Date:Subject:To:Cc;
	b=AG7Pn3SYgAAw2070+iNeGqGiVTBG3zlln/uo8LJ8qQTcOdNIFILxeVLxKsvnWoT/l
	 O1+v2Psex43Kh9NHO0oDDiZUD63UNowMM3qQdVWd7kaqBxcLYg3iJDOItQxX93xr9C
	 m4UXt8bg+UvHgm4tqm1ao9XSC1+OBRcgMjNsC68G1VwL2cGCr5ADw228Sb7/cDg+vs
	 T7DdCqf4ASDLgR60uX3G20rK5Unww6FogEstSQLM4vD/6HsYeNl6o2LA9YY73EzaYL
	 M4y9yjb2K5oI9aGLtdUK1+7BwGOT7UtOKBWcHfs15zqHOTGxZeytio/FMNQAo4nIP3
	 SIjPUO9XL5P3A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 20 Jul 2026 16:24:27 +0200
Subject: [PATCH] usb: typec: ucsi: Unregister lockdep key only after last
 lock use
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-topic-ucsi_lockdep-v1-1-6c1b5f9d1f3e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTcQg8bgVaSInfzqtNKETCtC6
 d2NuvwW762kKAKlU7NSwUtU0lSxaxvix3W6w0isJmedt0dnzZyysFlY5fJMPEZk0+8DOEQE7w9
 Uw1xwk/dveu7+1qUfwPP3RNv2AQnWWa92AAAA
X-Change-ID: 20260720-topic-ucsi_lockdep-b48ec8de8665
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benson Leung <bleung@chromium.org>, 
 Andrei Kuchynski <akuchynski@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784557477; l=1630;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=kwBeiDikT46k6mMawJGh4oczB2AGRDOBXBLGPVBFjr0=;
 b=kfwDJbzBXFw5HhhobMy/oi9NLrDExCfjle9dzfi8dIBHLeY12v9X6DFk8F4UZnPZQIVbOgBCg
 gV/JWlwzU8JCDCNduL8QEq2f0e0odoWgFCL6pLWxuDPjcT8daCnwfTE
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

ucsi_unregister_port() starts off with taking con->lock. Fix the
ucsi_init() teardown path to avoid unregistering the lockdep key
associated with it right before its use.

Fixes: 7aa7d4bf9d3f ("usb: typec: ucsi: Fix race condition and ordering in port unregistration")
Assisted-by: Codex:GPT-5.5
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: usb4-upstream@oss.qualcomm.com
Cc: Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index d221ca9bc88e..67c75e6bdfae 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2142,11 +2142,12 @@ static int ucsi_init(struct ucsi *ucsi)
 	return 0;
 
 err_unregister:
+	for (con = connector; con->port; con++)
+		ucsi_unregister_port(con);
+
 	for (i = 0; i < ucsi->cap.num_connectors; i++)
 		lockdep_unregister_key(&connector[i].lock_key);
 
-	for (con = connector; con->port; con++)
-		ucsi_unregister_port(con);
 	kfree(connector);
 err_reset:
 	memset(&ucsi->cap, 0, sizeof(ucsi->cap));

---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260720-topic-ucsi_lockdep-b48ec8de8665

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

