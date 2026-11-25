Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603227;
	b=W6RMUioNLQuoxF7dEQM0kebg62eRJeK+7G63XYwFtr2lhoqeTDL99UyDQ9kHvVzQH99c
	 SwlyBFw0AzgfLWUaXfmWrIX9T/ZkaxkfoSbrS8ILWqzEWpzn2KYfKTzlIQTT/9mKAoIqu
	 f3gPdOZAiya7lDljhLe7Gw7ROr4dddfnPXMM5xJg7Tqv1yVJqE4s9AfLgLrCuMrTjxEK5
	 tb7TX6yQVxycJVTiE5eksMpB8lpDe7QxMLhOKYnHSnD4InwJ7SlHH9Qb2R1TZrZwlfiSO
	 5eMnMQTD6IyrOQyLzON0nvLsg/eflH8ttMH0Wh+ZeZjaV6vh9Yx6gffR8qprgzOqCMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5s0ac+QMelxSd/2e8RO+qxSk0eZ8AkmR2391mVfNhzQ=;
	b=LdWrPEjtOXuUzL8Y6Sa5J1JJ4lii22M8hZ3A3oxlis15a62yj+8SIDt4o1cDQ27PSdo9
	 kWN+iVMmZtJK8RskpiaivaYYcIXXBsTuH65DEq/kur8fHTgCzPsvsOQY5x3YguN379Yhy
	 mYgIJOu6M2KrLmXpRtdOgUOSuISgGdJ/47RFeBdxHya6da7g/O6yRbdbhS/wqQhUZDXhL
	 ZWg0D7nJQ/xSRWmY4PAsrMa3uafeEFnoKox+IuvFtmV7Ohke7GhwqAtKNxy/BWGv2Ppz4
	 NAObuUOLhqLUdv6uiVBvK4Szy9jKdcBbnRQWgeZdtSt6JFJ4NJGfrEc4Y0Ce4c26qXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ikt1OSKQ;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C81606A681
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 10:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C81606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ikt1OSKQ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491971ac844so5045235f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 02:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795603226; x=1796208026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5s0ac+QMelxSd/2e8RO+qxSk0eZ8AkmR2391mVfNhzQ=;
        b=ikt1OSKQhF0cl+Cfqg2qnmVpv6U6ITZocmbnwaivaif/7jhIK2vhIme81MEPVl2Wwc
         5nnPTR8GGKlWjH/w5V7xfKJSqwslXHN6CbZO/XdQ3XQQOxVFWzOjCE/Gj7qT2m2q0Nin
         zbQ7BU9BasLjHigpkASjaca5d1kDJiyEvM4BWC2ASm9Qqy16mplCX0qOgAZLEF2hJdMO
         MztBAXW94aBB8zGIfCh/ybVoFnBBHF5XReb3f97OQVJ7+XziF/TRgqtvHEHB4clGwHvw
         WViWZ0keGITC5Y4BK/cOUFtLs4ZEOkGfT2OlO6BCjP+IkqPu7g8fSOOdy/5gZvGTF7Zq
         ulVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603226; x=1796208026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5s0ac+QMelxSd/2e8RO+qxSk0eZ8AkmR2391mVfNhzQ=;
        b=oi3354L62J47y9gSFE46vfJZXvnSSbt00WpLz1YLI3tqD87LHhLwZmhQsVCmV4fg4+
         RWJuutbHoP+lmJfi8M4E+9mlXuFROEDzEcSa9dwuYrb1L/59+Xq3L7q9QnTiFUJC6jF8
         8/0eGJHzt89Pe4jb2CWjUznX+EGWAJsbYCO5zn4jh7fChpSQ72+c9Uiz5pp/DvbTM4VW
         SeM5pAUezv2YdANBQOmFBOO9ycVWjHRTdMyxjHuGEYFzV7e3Gn3DveSYYC/r+F9/fxLn
         SbfkABl/qSVQb1ABvOuLEHaxVMbYI/owewI69ljOEWCbIC4h1XZhYqEFV5l5CYflgyth
         YMzw==
X-Gm-Message-State: APuU4Z9y4wcRlXmbUaSzlUqSvIQYl9tT5M3UPFaJM0ZaZJy6jGAMESYI
	IJsRFIg5nQMe6aCBWzDJSKq/hqMO6I685CUDDRySeQ48Xurf2amwqPk648MJJLoPbLc=
X-Gm-Gg: AZFdTZdMWcNOiKPJaw4qD7mC6FOjUN5BYv/K3V6Tv44Z+AnQ79+P2Fuzce7FdF2IDdK
	S1PCZgwMN09nWYfSOGzczJMqMfOioCsOvvg+sO3S7C5U8XWOnu2xV0AEQr+w5+tTEeFMDyhHWEo
	Duvg2OdzmgnF3OPSj67Iy9uNYmgAV1uvpyFUHbPJt7BZ0P26xOgI0itMs4s+malfYhGxAsZGQ9V
	DAE+pFJvT8C/ZJqLS3UqHUvbz/ZQ0rUqEn8fWPI8upst6e0JSqV++1F6cLH9cFaSMmwFLBMPCYW
	pCNNCQ9cqdLqlfmqIybAFcoPqrBTx14cGCEjsCF/ruzxWC4o0NeMa2L/+WkugiOs+5u/eDJeVwr
	Q77/ToLBuhrwvJgP8bi8Jx+xvqx50FStPn8G7KPYV2UQQABdhtcghbxLFr4zQX17lWAx5CgZEYF
	argfQN+2O2qldgG8NW3tTTkegYFjax63qYCJRzL9frbZxAYAuivvwvUVtRqlxyHXXUseoZqQKzW
	WTj/I+DDSjOrm67dq8EDsReHV+BmPto2KVOyVVRGNi2Ujn/iPZubhjWdoDrZKsNbB48l1fDHIZ1
	+5ZrKdNtEkZpPfFhLODARlu4lAcon67jxquJYXow0LOKonyU/C8=
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb8880badfmr335126885e9.18.1795603225469;
        Wed, 25 Nov 2026 02:40:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm527792685e9.2.2026.11.25.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:40:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 11:40:19 +0100
Subject: [PATCH v2 3/3] usb: typec: tcpm: destroy worker after reset_port()
 in unregister_port()
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
Message-Id: <20261125-topic-tcpm-core-fixes-v2-3-aede2a3471f4@linaro.org>
References: <20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org>
In-Reply-To: <20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <groeck@chromium.org>, Igor Paunovic <royalnet026@gmail.com>
Cc: linux-usb@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PMXF1eyiUQFfoUh1ooyaEy7iCltnT1EynG7cG6UKHlQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBrsWd9Yl2ueKRDKjbMonlpOADg2gVz8KPetQZGvJ
 eP8MaKyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawa7FgAKCRB33NvayMhJ0S8REA
 COn4KfWJ+qx7gZ7l7EgluUtIPxWit6pbM/PEJffourLtGPHL4sTz1w3uQtIDaYarskvHdnfHsbLbC2
 h3RVn8OrI31xOd8fKsyNPALL6Jq165dTINkfPtE8MMMl71rqCGltb+h9qB018hk87amyy/047hNwpE
 +Jqh5Y9VWL1VvBJEYMmUApespEJVEzaQLCAzQOFbUllzFxRb7o4cGaDsDdVVVPM1dpN1aU2jPCiwmL
 ixLJAO38mGlHA5AusFXvKQG935pHpZDF7NW3Uh4SXEkD2gNU3BQGcL7EaPBdJ8K7HXOGa/En16Rd8j
 Bj6l/zXcfDiFubN5XpNn7MrVYYGFyaBdhwwVWNyzVfinCQfRyauJnqPt4Wq0IRsQtVqC27iOi+Qz3l
 FQitfkIxRZUlLd+6/vK5yy/ACd3jUUEzzy08XPdR1GPilyzHgdEpFbE1NMB+RpfbuY/9vqzLft5I02
 md3HX5E3RjFIvjXuZoDG7XuyKR0lG+6ChJ0PvsRdEqP2MisCiyK+e0M8GO40gmEYGTp2Ks+aYbaxMU
 ovi6bqmmuMAkoAg0VftAJYTCjU1+EbxdIgJyEMX8/83fN77timseQtQOy6p1ggLqu48569jMHf9Kmt
 8SFpLn5xijKtApfTWrbd4m9Zy5ij6IZMuWkVZoXERE0t7oKqglm4AqKV48lg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When calling tcpm_reset_port() after destroying the worker and the
associated hrtimers, the TCPM implementation may still send some
TCPM events and call back into the TCPM core and encounter a NULL port->wq.

Move the power_supply_put_system_batteries() & tcpm_reset_port() earlier,
since it's the last function that calls into TCPM callback.

Cc: stable@vger.kernel.org
Fixes: 98d00deb6ae4 ("usb: typec: tcpm: fix use-after-free of the kthread worker on port unregister")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-224916@kernel.org/
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d0abe8100742..5e68ce2ea1ac 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -9025,6 +9025,10 @@ void tcpm_unregister_port(struct tcpm_port *port)
 	int i;
 
 	port->registered = false;
+
+	power_supply_put_system_batteries(port->fixed_batt, port->fixed_batt_cnt);
+	tcpm_reset_port(port);
+
 	kthread_destroy_worker(port->wq);
 	port->wq = NULL;
 
@@ -9033,9 +9037,6 @@ void tcpm_unregister_port(struct tcpm_port *port)
 	hrtimer_cancel(&port->vdm_state_machine_timer);
 	hrtimer_cancel(&port->state_machine_timer);
 
-	power_supply_put_system_batteries(port->fixed_batt, port->fixed_batt_cnt);
-	tcpm_reset_port(port);
-
 	tcpm_port_unregister_pd(port);
 
 	for (i = 0; i < ARRAY_SIZE(port->port_altmode); i++)

-- 
2.34.1

