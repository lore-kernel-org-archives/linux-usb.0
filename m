Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016394;
	b=w94UwpzwanNEvMSNbC1hePeLxHkUFMPehro9CExW9IL0iidZq/VK66FRFnK4RuyNJJ5e
	 yAXjfVEwq3fVJ+oXJhvDIxTq1JNli8ZoSFw2d1j8wfyvj048+KLzpszU2VMsIBmDFW6p1
	 Nmu7jq+trsQG7moaYKyo/HdB0gkwZPOYJOqmgxsH+GVBclLuSltcd/+Qwq2VPaj3Ckd7K
	 9NQja3HXpnIExUqnPBZirlcQidvewuGKmZapZUKKTs3AMksCS0vinbHqgB7cVA/SwEs5Q
	 OpmuWiFUtsVmqTonyaE7rXDKCy6sN5hvz89DwACuxGsF0Gp8bjgi9P7HtT+/gNotb5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
	b=yf7FenPASs8E4xOVZK16KiC/8034CwEn9Vh/5YeHRuG06zkrvEDXPuFn0YwNdlNxDuvj
	 cj5fAy8PbGRZXWsAIKrhAfYA5Z776VCav5QwNop2aeNp33Y2Bem1qdn74LJpPnP/cg9f+
	 kG5ldel108Ch0SajdswsW7+XS/7bblSsf7weKiYyJrTviuhxTV3ietAt7gaNaz/5y/hzS
	 kNyfx8lP+HKOyC2+DZc6i7JUfB4YQ609oD4sN7sMO5nM1tb5u881EdmMgKomATYv/gXmt
	 sunQs1W/pAKzvroYuxd9TupEoq3wdHbO1+dL4F6IsTURk6YVPCxTxOv8NaVkIiQWWAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ei416voR;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061C2606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 12:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 061C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ei416voR
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso3776807a12.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 05:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016392; x=1793621192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=Ei416voR85Y4wg4V5S7yAdpAFhy4iFvnnScN2xR7zmwc9QrWpM8gYXv75zVhHuj/xj
         FJqsZNVa0PBuv6rufuAkmAsDA2F1f65d+4bdEd1lAOqmqW2YUdCMeRaNhWVGEpXIBCNN
         MzukNPXr9JXNOll3kn4Y0KU2x4hKUPfJbn41ejY6zCXlt3Phk5f8AzB5gdX3qZ4ZroIe
         BhpS/pPORgnsn8wYNqYMoODOy/qi2itMtU5yTOdS7zzYkGlPUyeqv0pHIyW/NvVy7tbq
         bRhk0nuKKLMgqZ2Hw8ywkFkndgrc+Q6M0/H+D2H5rosK/UR2cNIf1EUQiZ5H8NVMGwyn
         T4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016392; x=1793621192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=XtfgOFR+3+dofd32FPYD/NArjEgjaJtOVRE4NkdbhhvzxEqNMsFBf++/pUBC1Geh79
         9dcx2QpyOU9wzj/EVFiUcVPiw3NyLrwm9mDyu1OAFmYicnxOKFlpRHB3cMUbKI3xVYa/
         TXRDiahawjiP9rkzNd64iLndPYwmzNvfH7MOAQQehrO8LWFe38xMYo+u43eJ7fuZ/BgJ
         07Vmf/2iGeQIvZWwsVLY3eexbxwKw3zw/ucBZ3gnc3G3BFUvpDJj9Td5d1BZJ3JiCPQM
         VGL7N/Q+Thb00imgD6vrlijmB2pLYnSNhYqaImvv+P7CITn11JdAvuawddhfAs9t7gKG
         XnQw==
X-Forwarded-Encrypted: i=1; AKwUvBz84QDqeYbFQ5bRHC0TJSuuyrNMrerWr9UD+SxcMTU1ujFHUu8N9umLqaVe2lQkxIjHJqrS9oR5WMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVr3T8wVXFEBFSikbhpmnVaywzjHa8h0Kagb033o3ct+g8Z03t
	YJ18i02I0PQi6X5kPehJ6Fi4QvWsVe2+vQjtuWIen7J6vsYXmpasDlEJ
X-Gm-Gg: AYBFou2qZDX6XwJw3LA01WbQCBlDkKl6wXVycRVtsNWKo0uIb1D8Xppq9dvB2gY60tG
	BZCTjj/b9ub5me96c4PSJTPD+PhiQvvbNWOQlI2JT1FDHuPhmg8ul+FhsptUSm/0SYeaKWaJymq
	0nd7IYrSmjJCL/7xFRkZFAby8XhIYEf18r+1qmeBafAzxsTK0ZbUJ1Dsns95P7WdrfNqhYWIpVi
	PO9utNSilGOyXk36P3wcLF4HQ4XDXyrlvWy+STSOVruZFNCcN2WXE8WR/mBJ0kupkvjjCxpTX55
	ah9hnPAZLflqZfKGGpQoKQVTfrScMIix1n6R/8js7C7gSSNOd8oWS5Xok5Cc/F108R1/k56K+D+
	RUG11bg05Xi+hfANju9EL+x/5TiiOmeCavwiSCbBVgLbZBWY/DCVqUlkh1XbU9RFp+c3t/wgOqQ
	0fsDtodEJHXs7V64WzvctDATscHAsZ3ciFWNemvc+ThatVqagfr4UFYDOrhHZVWFPlZKBhH4zZ/
	xxvRi5yHfWIJ0RiuQlhMaL2mZhE+KeoQs7SnL04XMPX6+O3
X-Received: by 2002:a05:6402:a519:20b0:6a9:a362:4646 with SMTP id 4fb4d7f45d1cf-6b442fe1314mr5274732a12.14.1793016392015;
        Mon, 26 Oct 2026 05:06:32 -0700 (PDT)
Received: from beelink ([187.13.23.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd11dsm3666492a12.5.2026.10.26.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:06:31 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>,
	Kuen-Han Tsai <khtsai@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: f_ecm: do not notify from ecm_set_alt()
Date: Mon, 26 Oct 2026 09:06:14 -0300
Message-ID: <20261026120614.39338-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023-ncm-ecm-lpm-v1-2-d01e81fbf460@leica-geosystems.com>
References: <20261023-ncm-ecm-lpm-v1-0-d01e81fbf460@leica-geosystems.com> <20261023-ncm-ecm-lpm-v1-2-d01e81fbf460@leica-geosystems.com>
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

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
