Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603226;
	b=lFXyPszM2psWG4ipH72RXPNH5uP8RDgs1zfQJYZW4s1NJdpdu8tDhBNcNn1Tr51oUUa7
	 xmU0HUAt/TrOxYRxwOBMluoCgA/dtK8G0QS4l8Qt8Zh+ERzHtQwX3Js1h4qWVNvurCnYX
	 v4HRdZi3/kOkGUKIXMg/VsJ630Tm8Xvp4ZNLzatQjRbmZsFZOZm649CSLI4F+KZqbLNuW
	 2slMmiL0+GT3r9AGvXhalbtvA42oJKufY55igfJAQKRzDCqtdoAGB57NR60gij2c2jtU2
	 7S2oxNPooJfqXoTRItb6WT/wyyFhlZvFQnod2DA5kBQ/gpVBZmjYaOcUqs8kZra0KhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VODHi/MLpc+ZtHryROUioFLiF8Foji+sSV/+pxzQ5oc=;
	b=m4s/Eq+oZO5pM2a/wC6vYBk76CQgPT+6d8T7OsHJ88whV7obxK0NZh0Z5YKIuoUT+anO
	 76/ZYVKKg2nLIUxol9OO4eoXbzMh32EoE+qvJ/NT/4wsNRFoyWMMFa4Pios/Y/TFDWIDz
	 n5lctfvqLwWfUVrHbMhzQz7f/z6rBSvnQISg7dk5+dQoBd4eVL6W9Tz2DTxEXwWTYYVGw
	 YFXapqba/QNQnhiIO/SAOO/aOc3nwdRY6twXShgodp1g7Sqk8ctk3uPAScVf93lbF6LAw
	 xHyOlzebUWHOKNvzT07LNKZC+OSYkt7uNUcnmIfUnvsmDSiDgj5s+L8Xh8C3mmbxR4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LsThTw8x;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB9F606A33D
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 10:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB9F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LsThTw8x
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so48162485e9.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 02:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795603224; x=1796208024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VODHi/MLpc+ZtHryROUioFLiF8Foji+sSV/+pxzQ5oc=;
        b=LsThTw8xTGNyvxA8gN17/1cV/qPvJ7KLNKXdvjQSyrrKNuAZcGTUMhjuu6p+zA9MaY
         yxtTy6+DfYYAZshj/VEKgNtdKrx/am7T5jvodQG72zD1v6tPkvyhapH5KpzEYnKzLSmN
         KSSqhIuZAxKKR/S+eogQGwkrJY4/Gms3h9H7APc6rNp0wzTdhvlPwtcW/YtrvH9yXVya
         c40uGvu0L8wCeYSgS4Ae/x6MG1ietvBCrq4s3Nm9NaOkbpfUTg+gUAE6T3kgq31yHoeu
         ctho7xQkNSsoclcByDqVlz/xt7NXLhK1J5z8a5cagniKEUQIxIuWwN4RJvfmoyRKu7mM
         e88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603224; x=1796208024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VODHi/MLpc+ZtHryROUioFLiF8Foji+sSV/+pxzQ5oc=;
        b=PJ/+T45kiVbFmVFbxXiSCTBLJjQAJ1McRTMymchBc1d6Uep+dSl29EPbyW1zo8iVBE
         r0tPUMPMJwpKrKo9kWhMMo0NveRO4Hl7aJlNfAr3scetjgo8d88ZDOtsq+tDfVPZcZtW
         gPDqZXg4CKp2gyvSYguBCfcCwxvxSwtI+PmOj11FmPj8/6ipud9JJdg0U1WocLtFYko9
         gmHWgZA7M14Z6v5youcQEmWk3wmYz/npxgt5zR4Gzg1GLgcusDC1GSe2sa8U6but6T9I
         oHOLG4qNaTb/dAPg+wp1cw1oJzujQoJgVVF2Yxn8LC35sNgCImxbgEDprHZwnnMi/uuG
         j7hg==
X-Gm-Message-State: APuU4Z+dDA2O31ePT5cDF+KtH5Qw3gFBSFP408jzTb7GGBxP5Birkwdw
	xa1vazxO96cgs64Y7JgN/eI1yVaD2vC9eW4yUARiLNvsGBqVUqHYxTYyEfT92t2hDBk=
X-Gm-Gg: AZFdTZduL4rs1CCQSbYdaV0xKRySjx5YMqj3GpjlKpysgJsLeiLGqnelt+bUJQguYJs
	za4vUu//ccZbaj8qvXHP7BXf9a0IUpem43qkRSlldvwstNu4udA1sPUEm0kPdzhV5WfjJXNA+a+
	XmTmo9W6+/1wsm1Cf56Hvo2f69QpOinDo0vsiYjzfSPyge/M9OpHXRjBCDYfzbdXR8uImCkVzio
	VQz5KGipROcGc07zcpJxU6gQ4sb+qHwMPYo3fyQpjo+5bD8+IQXA+aqxOTRcHi439Q2ynQICQ3D
	oX6rFGAIYzcjF5aVG6dZirHiKtgCDp0N9iaI2pihi0yvjXCMM0HL2fYW5aLaT8xQlTc3wyrD2FR
	5JxxhDUrAj+uKJKxSG+rSKjSlasOHuTsJvLE31XxPctfzFXoSphvla9n4eIQnUM8sbdCshmUwzY
	yrAJp8de14oebnvdA3G2ULX8GTanGphSNzMdPgqgdQY1ANglDi5RgYpVxjrkoz7Rj94KXEi9yH7
	LCIyqmhZKPq6DeO5QeCKVPtZCHrN87X6OmAOlGcRRE189U61SsBTubW9TBPk+PHewM9AkDqCG8+
	l7QGeBwbDMwDiCNF+G0vR76gANescXtDT3F4xJsxyFMoCOzePce/GkPQsmJ0lSVEs5fPq0g=
X-Received: by 2002:a05:600c:3b83:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb88822242mr407442995e9.28.1795603223958;
        Wed, 25 Nov 2026 02:40:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm527792685e9.2.2026.11.25.02.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:40:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 11:40:17 +0100
Subject: [PATCH v2 1/3] usb: typec: tcpm: unregister partner altmodes
 before re-discovery
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-topic-tcpm-core-fixes-v2-1-aede2a3471f4@linaro.org>
References: <20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org>
In-Reply-To: <20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <groeck@chromium.org>, Igor Paunovic <royalnet026@gmail.com>
Cc: linux-usb@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qPhGNp5TSTCev4Glk+F1e48Gj7YkbH+PSoXFBjOFR6o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBrsV5HENZOOAdIw4hVBN2Ya2oDpdmS5Xrix8Rd8+
 Iw9BJ9OJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawa7FQAKCRB33NvayMhJ0SPkD/
 9hhpjhOnbsPYn8Rtma0aMwzM0X8yky0SvqYSJMuo0fXoFiTAg4c3J7feG3zEYuGI8ZfdIGehFTf+YB
 9b7YIMen9jEVceCRBpVAyD/4jVW6jUIvH2hziZAvgwLc6pX3g6pJNJUzpqm5t6xJlk4vFctKOWcaw5
 GFELApHqHKd2Mbp+BIPZ27KRwwnzk4gLjikhsLzSmbPnuy/zPOT64M1KBVJQAdodcANB5cAKjGyMEP
 V1Y1I87jo1lSy07Oh+/ct7OfDG24kgcPV80VuISbrcOdlT1ke6eqlT4EIWov//W7FwrNTU7sAuOigS
 DnLnw/gg0826Puh1p23SHIAD7tsYqWhyjOcHw1gfyUUG+IcimgsA8jETcQKUeN4uURhgLf0kd9XmY0
 F/aN0OjMWzs4XtJ59Sd2KmWAVxGohp+jNN8p+30qkxr2Yta+hBDNftduYbp3dQNlmdEimpgl/o95SE
 Z4NvlrCM9++RZkhznHGVLDdqGUIn+IdHvkmUAD/ZkjKN4XtSyDNblIMIk5MkZJiMRsGnWNgQHPAPOf
 dfx0DDDiybOlDlHhcC2G+cq33+43ZlZarTCF4liN0wgO9VrDd6fZajV09Lh08IhuZHtliw8Dcyisgy
 dOz30lNMTuahEHAQbcXWjeSdparFHzMjVctWn7XDE76GMuS7FVBC46dhRAjQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

svdm_consume_identity() clears port->mode_data when a Discover Identity
ACK is received. mode_data.altmodes is also the count used to walk
port->partner_altmode[] when unregistering the partner alternate modes,
so if the partner altmodes from an earlier discovery are still
registered, clearing it leaks them and the following Discover Modes
round registers a second set for the same partner.

Unregister the partner altmodes before clearing mode_data, and reuse
the new helper in tcpm_unregister_altmodes().

Cc: stable@vger.kernel.org
Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
Assisted-by: LLM
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ca38e05f831a..20e18bca649e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2068,6 +2068,17 @@ static int tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
 	return ret;
 }
 
+static void tcpm_unregister_partner_altmodes(struct tcpm_port *port)
+{
+	struct pd_mode_data *modep = &port->mode_data;
+	int i;
+
+	for (i = 0; i < modep->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
+		typec_unregister_altmode(port->partner_altmode[i]);
+		port->partner_altmode[i] = NULL;
+	}
+}
+
 static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
 {
 	u32 vdo = p[VDO_INDEX_IDH];
@@ -2076,6 +2087,7 @@ static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
 	if (cnt <= VDO_INDEX_PRODUCT)
 		return;
 
+	tcpm_unregister_partner_altmodes(port);
 	memset(&port->mode_data, 0, sizeof(port->mode_data));
 
 	port->partner_ident.id_header = vdo;
@@ -5137,10 +5149,7 @@ static void tcpm_unregister_altmodes(struct tcpm_port *port)
 	struct pd_mode_data *modep_prime = &port->mode_data_prime;
 	int i;
 
-	for (i = 0; i < modep->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
-		typec_unregister_altmode(port->partner_altmode[i]);
-		port->partner_altmode[i] = NULL;
-	}
+	tcpm_unregister_partner_altmodes(port);
 	for (i = 0; i < modep_prime->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
 		typec_unregister_altmode(port->plug_prime_altmode[i]);
 		port->plug_prime_altmode[i] = NULL;

-- 
2.34.1

