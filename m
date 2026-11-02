Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656287;
	b=iYvf3jm7SR5X5ofOaoOSU6fFjKhJ6PcA0Xb4nrlMhdGFe0s4HMU8ZPwR/QnPoFpLDIRi
	 Ikec/A/ttZdHAVxK0JgaKD+AKV2hAIGfF5rOpMyOk6aN5uwJlN+QJ4geJE71wLj4mcM+9
	 2y3an5MeFEizqkSGCZmhz8xVoIfe4q3BqKgvtx5ZPSHnSvcSnzQiRlXQkC5p199zdAfqx
	 70XtadT58gzLMOmixR9gY0u5FOXHFL5fOyu1Quafa/y2A5rShq4dGTM8loryDWJe4h/3M
	 J/5PPqyu1IYxda5nXRu1ZjMl8iqMWw8G+dy3ij7dzCTIoA+SdJGSXiK610UCNeGkRVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
	b=eqY2EHcStKqoLSCVJc55av5aZ8IOVeICg+TV5b6qcjFsBQcVokXF2PAwC4N2I2XwAZbg
	 qsNyYyezLZ//KdsR2NhG5u68/DweC2wzrSfRnsu2iiSDSvJdOmdlKhV4K4+tVAcyOJVIe
	 egcwuvfSUMxyNSZteEVm8/Ie4NoBLqME/c0untbZnWNgBLpSjp7+gz38H+uJzpnT3IM/3
	 OdBdrzmoaAWs3x0AQkk+x9Ps0QpL1lpcSBEAVUBzjtp9f8EnxuM92rSKVzOtgiYErTpcc
	 QItlGEKZE60IruknLEYG1LmdYdacv3KLgGpTdlwjs92p76NDygt80IwLWobCIjGzcNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSFiY5V4;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6576B606D811
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 21:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6576B606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSFiY5V4
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535a54bed9so5260831eec.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 13:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656286; x=1794261086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
        b=jSFiY5V4htQFuOq1u08r6Qy/G9vfmFL+gWNi9Zov/cX0AtuxOSHykXbgpWUR8GBw+F
         vligPDvpGOytNAl+tBbiN1gtljoS+qjtWY/zqgsd78fH1CJsUmQBtmrUDj52ieCDsmDb
         0+jTbCn+BED+Hm9gUyz1IqdbOe1qK2Jt9lx26SOaL1gglKupCNwhVQ/5bOcIXBYf3ygP
         aOBT/NoW4Jeo+oAIvW7CuKq08AWQhf293gqnRFwbQWqifgMnP+EXtnwzqfvonjJtZRYf
         ULQ9V3f3CKOhUfROm0MxFAl1JDMvmLdAJHjM164mZu2RegECHqeKeadRcBJ3QQTzoYED
         rKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656286; x=1794261086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
        b=HmwxpfXwcmcWQ5ICwc8zQaXG40cBSdYDv8DE9RJEzvuk3q+YuKjXJR0zZJhBpt67w2
         WRq0qjBjgxy+RwxAHMpYp7QhISvyVmIEJPj7guvnB8chO/r9DAFRmz+Kb0xAtgJPmY3p
         BxP3HQkz3Fl2LCUhT/w8hvs5fOC7uhClAXRGEWCUoDZg9Tnc6TAYsxksdDNIm2NEL/y1
         IO48P105x81/AmlN5f9fBshrYxwY8FWHTITWfeRdQPM5VSCjnVezFwZpkBuLZMnppz1x
         Hk+yaGUejY5Icgtch8yZaYLhnbMAOLYpBPmyVbmHvXjzfCRqDbqznGRJyPeBq/vz3SfE
         yFJA==
X-Forwarded-Encrypted: i=1; AKwUvBwYRlS+4X3/NGHOntXYHcXjn0nqcOJR/zDWGzZPPA40xS1Qt5T/YnuJQYw07Ni/kOwnUU/int5GbrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A0D2YAziekgVzh4rsIbrrSr5BEyA8uM7IU14YIKZdBOkALmN1
	jrMUbsbqfjL8tWA5kKhP1bjeEJ7rLgDtlnfIv28gDWMozOkiN1Ff9yM/
X-Gm-Gg: AYBFou1egXyqbKKwXUCjALe2MSgGbQX/zjz1FGADx1IRYjVtYVJY7et1HLgG9nY2MLI
	BtD9QGaBVgsrXvhM+tZgaExhd1BkNZNDBO553/54lRGgVDeDppQVmfq7PkFeLR9PdfyaFMc4lpa
	5BVUns6LDsAA5hFQhZZgzODEMakgYCznywO4ngrNiixyoHDvQiZ25B7w25OgAePUaD5kZriUNXf
	7rnU3rhzUsf/i2hwI4GUr4nEo1/M6UakMSqF/3hi52GIBndhsHDIBw80sQ3rw5j0uZXdknn7jcv
	XbAETYlFsZ1KOh1JM34JQc/Sfpoc6z/trPQgqMn1N/Tsj15IrGTmm3TgQgMfXtRg26cMXN2eDbb
	QG9wxap3AkPL2Mw82LK3VWYRzuCBG5MGdOVubq2uu4hCkayiq2SZRX1mBX/ssgktgsbLMwWKwi/
	QOP3PtpCPyRWwHXYCy2LDq0uEQgZD4OZ8PWNB2mbqMLgcEA8fEWe8zWqBy1k1EUL65xhpgpABDI
	Znx/pE3/KK0aSgripgxJ4iH5SYxkw+oyrat1I0PNWSS8BnfiQO3cAYBYwT6wYbd+Plw9r3uVcYs
	ewFjSohcWyekWvhZB9JLK/EcLl2JBc/J8pO5l6/+GjEa
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr17096566eec.17.1793656286305;
        Mon, 02 Nov 2026 13:51:26 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm54710712eec.16.2026.11.02.13.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:25 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Tue,  3 Nov 2026 06:51:18 +0900
Message-ID: <20261102215121.738-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261102215121.738-1-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
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

The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
DisplayPort pin assignment gives it all four lanes for DisplayPort,
while the controller can keep running its USB 2.0 port. The controller
has to move to the UTMI clock before that happens, so it needs the
Type-C mux state as well. fwnode_typec_mux_get() only matches graph
nodes that have the "mode-switch" property, so allow it on the
controller node.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..1380b769c73c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,13 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  mode-switch:
+    description:
+      Flag the controller as a USB Type-C mode switch, so it is notified
+      of altmode changes. In pin assignments that give all SuperSpeed
+      lanes to DisplayPort the USB3 PHY stops its PIPE clock.
+    type: boolean
+
   wakeup-source: true
 
 required:
-- 
2.43.0

