Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603226;
	b=lmr1PhFmoLYMrjGtVu8ZH3Yu0dGL/0ptkLtF6cKQIwoNLg8P6y492HhzYgwY4gcRgDiO
	 n3kXCyE28GWbBkCrB9XcfcyGmjS1R8p7yA0hg7shrwhBJoACAeBlWSgeFncwXnc5tfSJT
	 kU90luueGK9n25tG7+SwI0nf2hDoxygVXng+ARwQgz1bCb1MRxjsJQZIGi6xXRrqmiB4i
	 umbip49KrE6cVilCv31W43K6sB+oG1XpPp+7c08VtfWAWY25X4FZ/nsfjTzOoPQ977DWM
	 pI1R2fNgtunkd0e4SCKFlaJkzXkWFbktm6R9fXAoiRUgCjYkugGPGvxzd1xeWeWFYyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=NZipUcVcHdBknGUjkGG12XLaDn9eCMRayIr3W6ZIRCM=;
	b=shwY6PK3MHs4RbpLGz7x9jlvAhtHAqzEbQbU57byjGw/meEVSN/miSQsenHVaIt/5wit
	 WJcO/uovM5NX6/9XqAtvXJay0QidlZQIDYFK5Uw7X3MCbYyKrfd3cgdno2nfn/XmLAWdJ
	 5ZJ+Ftkgj90B2GAf82Ucb7o6YLVjP5HdJRApTnLD1ydZCKnCCEI333cv/I9aL+vGE8vXn
	 83KJsI0YYb+qZpJZhQM6KwaC4qwmHQI5PCs3xON0dWsFX7Nt2z2ZyK2s1Skl9+v4H2mkm
	 N04y4JJdKR+0wHe+aTqQoJD/QG6NLeB9obp9vmlVnrWw0Z9IcCrIfGcK1MbVj0OnBLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bLKCsdEr;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F77D606A687
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 10:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F77D606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bLKCsdEr
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so51840765e9.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 02:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795603225; x=1796208025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZipUcVcHdBknGUjkGG12XLaDn9eCMRayIr3W6ZIRCM=;
        b=bLKCsdErWzJ9jYGeHEu6N9jIXtfIdUs81THE41qS9IDVV2RKL4LKXvlfdJOy0KR2c2
         sDyXgmN1W3x8UKItAcM7NynnFysGUWXA27frAxdheCRHzSdW5w9cdbFi4H4LuHv8RjQ+
         JTZnbFz2k1UqMJ27XPrnRLBoa43WcPtdxgOa0YdDcoX+zMerwgz+LAzkJcZc5iLd1Xo5
         Jo89P9a5qjzfrRxGLAHr4Ywq6yy2M6rZCVxwA5G4AkGNWALsnZWS8Y1O/PL615+o3Yr6
         RprHL2jbp3T7t2wusdqEMrN+E04TAvvXychyP4vTHywdUS5ViQnK/mLgiyEBjdfCJn8S
         n4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603225; x=1796208025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZipUcVcHdBknGUjkGG12XLaDn9eCMRayIr3W6ZIRCM=;
        b=PWTe+l2ddE4FbO5mz1wNwgAIP0yWAAm4G4ebAEN8li9wZ8+1peQ1dE6c45bhhB/QmZ
         daPG7Nr+OwMjX2VmWU8FAtc0LFQlp/Z//LGcP1CizicaNsfgZ6E+DdchKlcnzT8jjkUe
         AQXknp6gefS+cw6m214DDZKPal45MmT3Xs9mSZ6GNLFcEjMZDAO5evkfjKUWOX2XKbTb
         yx6KlPIb7iYswlZgWfhvwiYeF2dGH40hgfQduwHvRahlJEXacujXhGGskwn0Y6vLiGi8
         wtJ4FeJnW++Jsw3VGu99YhdQ//YXzUYa1aa4uSpgIx7ayhX6ZP1SDxhE3Vva0jjvrxZD
         Z2Rw==
X-Gm-Message-State: APuU4Z9tOVtM2VvMNywuKB5SHBjmYfy92Fj2HEPVuD8QOce/qYSeym8I
	jY+wJy7r6vihQFj3Zd8+ok/1RAiTqgQ2wyzLwWQNNpU+Vp5xHpCqwtXI9FRXKulU1RTKsoX/xFW
	kYG6eEP7TvQ==
X-Gm-Gg: AZFdTZdTqXyGjkTd9/PLvIR/yydlP1Qaf5+2R3TWTSGzqKwntxZGws8oEIJae9TDf/W
	stgvnQMSkTjDjmkaOeywga2gv0vu5OJO548LmYnbLj5GylkOtd7287YxBLNBoo6lBZC5+ncXfmZ
	CDgW8YyvL95+ntBBXqJvx+KsR3Eiui+SRCn47VZ8XQOMBliVhZocTBJcoAlimNCMcWWCg4pkb1B
	dMg/xPSvcnkIhTJOLgCK97WV9paimb3QFrU6pfIgwE5JnJ/3JcCMiblVi3rXSOrR3NKF2UmcejM
	X4pzLgjTcE7PUtA3SEaSjU9Ykwl5SSc5e2lt1GZM/WvXdGwvbWYOM9vbxkSuR2S83e1s1qgbD/q
	UCWnakboAslV26mdqorMBBO6DpGZtDrxqPnP3FHvFOi9uwYpIzjndsrM2+4l6Wa1/7hP19sPgBx
	wx7tRDV/Uk2UdhcFeliOTUrr7dbaPePYnqsXJrYFWpL7hQ5eSnQyQ2v5FxaEBuxDaGyuZS2UFwN
	NbU1+QxpdVDKRep2jkzaYNwktNnrGtZgnfEy4Up9wAbboPl2Q5/qMt0c2N9P7PsQoQj5omJh69E
	IiMeN5VmTurut1PmpJMEkEliSYt8H5DOrREMtn8zK9xzgaB/Fg==
X-Received: by 2002:a05:600c:6290:b0:4bb:741d:eba with SMTP id 5b1f17b1804b1-4bb88824a5bmr351028555e9.13.1795603224592;
        Wed, 25 Nov 2026 02:40:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm527792685e9.2.2026.11.25.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:40:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 11:40:18 +0100
Subject: [PATCH v2 2/3] usb: typec: tcpm: unregister stale partner sink
 capabilities
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
Message-Id: <20261125-topic-tcpm-core-fixes-v2-2-aede2a3471f4@linaro.org>
References: <20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org>
In-Reply-To: <20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <groeck@chromium.org>, Igor Paunovic <royalnet026@gmail.com>
Cc: linux-usb@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=07EBmlzjWFz7CQysUew3EdpbM6jzq//b4VdC+IUafRE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBrsVTjlFXTwyIa/88RmT/8Oft7pgmvbnEtdCiEKN
 EdTnAS2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawa7FQAKCRB33NvayMhJ0cVaEA
 C9hJ0BZ8J34QldTFCJpP+6LsaDNNn1J/qKTLhtuw1vNht9CRYRfYdRLAhHwO+sJ2yP6Mv7Q7GfBi/d
 wpKSR553XEvhLBX2B5dh+i9OiPpGcNfNF3Sb+7XWwwTSg9Mxjk8zv9cFPi2KWXI8ULXOLHHt89a6Om
 HKmHF/dj98/z2p7x5HFeiV92G3jPMuNojDdGLdRpNs+jtfxBJ/dsd8oN4xE1yyjts0jEcqXqGIQTma
 ii5J4jrIeM+jYNkQlnkZkJdTWM35/2YFXwJ4ksjcAruvO/Akil7WwJ2zGco1G2pqVKhKm4cILEQjrG
 5smjMZWZWovh5TVI3PKp1Ms4YYmTTeba2SNDiNFuqdN7IqR+NEaRVMbUn3DPsXalJqgQFTGbzGkMIm
 ROIkc7ytdY7HMf/PbDyK3TQo51RKwDrxrOW2obWOkD/pFyzq16CE8m0IKm8yww5LrU2+hbxOGZ3+o0
 FMEXKhPwqnW8KXPqy4WwgRExFb+nFIMmN1+kQlAO6zTFgvse8CSDWoUgHWx8+a3cOe8OH3KXNPFmqW
 383oNbqNDFXJE0XZeygZ6qwovp7oACpw6v8FbnEsoFYp7ahNz9SBsqSqc6ZQZYFQCvYTaPyoibacvI
 fSpYs5FjWs7AAgyfA+z4EMmWTQe8h4rPfeDWS6lNkVgv3pmNw+cQvx/GlSAg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

tcpm_register_sink_caps() registers a new "sink-capabilities" device
under the partner USB PD object every time a Sink_Capabilities message
is received, but the previously registered one is only removed on
detach.

sink_cap_done is cleared on Hard Reset, so the sink capabilities are
queried and registered again on the same partner: registering a second
device with the same name under the same parent fails, and the stale
capabilities stay exposed in sysfs.

Unregister the previous capabilities before registering the new ones.

Cc: stable@vger.kernel.org
Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
Assisted-by: LLM
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 20e18bca649e..d0abe8100742 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3559,6 +3559,11 @@ static int tcpm_register_sink_caps(struct tcpm_port *port)
 	struct usb_power_delivery_capabilities_desc caps = { };
 	struct usb_power_delivery_capabilities *cap;
 
+	if (port->partner_sink_caps) {
+		usb_power_delivery_unregister_capabilities(port->partner_sink_caps);
+		port->partner_sink_caps = NULL;
+	}
+
 	if (!port->partner_pd)
 		port->partner_pd = usb_power_delivery_register(NULL, &desc);
 	if (IS_ERR(port->partner_pd))

-- 
2.34.1

