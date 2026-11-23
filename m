Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417276;
	b=PuMN6t9+4XTIkUa4G9YnI3ZKcE9jsQlz/pWGwP1k26rxeBm4fUU+VpEY3GlRPCuAnCoH
	 ZkL0+6N1EF7m5w5FL5kT9TBrMZno/RknnaoEy/1k8uWDyL+Mc/wskOWf5/bdZhm4GxTl+
	 8B7ud2Uz8ECh33YoUTBgYW2M9Tw/poz/nMkmcxFpkdxkNjraww1fcDSW0Q9tMk6BGkLGh
	 k3i6x7o+U1r7Ypiyi6R8oHtBIzLQsHLCmSnGJlxpvpTrgpb4sKhb21eRgaWI9HLYKFCQF
	 0hiwHQBSC7DeqGnbxgXKF2ue7hEQ4x+RhMV5ypcmhBXz21JiHMLaks7WzCVax+w5rMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wOsuRVgpL9gZBTN3yhy3WmQv6nl7mKO4w5iI9O9n2S8=;
	b=lOO8dVTgsU3rXgD8jQTyfFRKbEDJcIGNLkO3b8A8xedm+IjPrzsIPKy1PsOlrCJXSBlK
	 Ykw93Hd4NYTWwrTUEX8132HR8kjq1oQtpouzVqgmmbB9CkmsssgkWi5pSQruNyY7K3ojQ
	 GC5BegwYYas3DkEBmZMol/BWQkD4bC+to+N+3xUOKSNYjEEzx2/Yi5jV/eIFrS+R+Dast
	 HlHdycHFLmr3dNOFY/IoaR2pWoyON87wlvbIlEaTZQcQ0A6ishmBEqegigLQjfA4cve+c
	 2zN5m67teAsbIiWU1HSVgS6NKIFUDjRnLcyQPSU/T31QJl/eyxma+jnrhEhmQnyr00w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RphP6QPa;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A32606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 07:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A32606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RphP6QPa
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b5786e099cso205255c88.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 23:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417275; x=1796022075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOsuRVgpL9gZBTN3yhy3WmQv6nl7mKO4w5iI9O9n2S8=;
        b=RphP6QPaPtA0raybonBWMXDqrJQc7DtgmWQXv/+2D14H0VkMcsmEiUy7JjA2UDr97J
         b/FLvGpFg3oypeEjsFTumWnuYa8IOZ8VI23cAOCMd99urJkb0SAkYmIxzt+DHdtK4jjs
         Ima0anPotykxxv+Y7tF7Lkblz6PHe7oHnMo1JwZ10AZn530XRrz8IuvW2WjhkNH6VQkc
         k0rSEEoNQsckYzqAiAz8ljZhPRVs28eD0CKLwz2eBlqhqccKQ+cQwNg/kOrNguocBQue
         H5VqtU/dEmu5XweP7HK0AOPnzNMK5jT5uNcaqf3tmDq17WYB72QfEWhGtNJsWBFItLAl
         J+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417275; x=1796022075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOsuRVgpL9gZBTN3yhy3WmQv6nl7mKO4w5iI9O9n2S8=;
        b=Tx9/jngelD/+LpCYaClev+ZA5qPdKkUVdEvqck4fly6C5rSGc1YnioBdGimIc230hR
         YopAmdbZpenhN2AE1ItAIrGqIqIk24yq/2SWYQpr9hzCEHh4/AQPzUiM0KFugFjPPngi
         1teMn+vdDChpNo7xtGuKV3K1uj4jVriMTqO+vmvssrOEFW/71nYbhL6q8vIkK3pJpVzn
         d6UXsVMG34icYG/pZcbPSNqJjcRJQHqV0ExgZ227o74SRTIG6QdzI1CtNtYXg02mPpFG
         7mD0i7pk2UeKIHMLV0wlC7N1KFBWlmYFO9YHv4wPEASR5qoz2Uo+4ApDIvIsMklMWO2r
         vsbw==
X-Forwarded-Encrypted: i=1; AL+hErE6ChHkJFy4ilcO0Xhc3E8AJ+3FOCAJ0rDhlE+aPdbnxY4Z2fyetI1bNK3710g1xclOCL61Cbr0eQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aqU+ORIdkLBa+Q+9npQBDoTmG83W6uGNFnGXzCE9XmP0fTVRL
	zxHIsG4ncYS9VEoAunQ7axg9QhgHVqkdSQGdXqfBoc4hXf9kFixf/sY=
X-Gm-Gg: AZFdTZeE903NVYZ3/lokCzvdDG1z/FShK0J47s8FbgQdu0VSal4kC+DJ2PoESMos2bc
	c5hAFrYpASmt1H13HSLE8X0ot+4eMGF9Mwi7PrYtvtUQpCMLx9Yj5pQSzuk+ZxRkOhUw6F4AhzU
	0hh5ciKIYv5hartgQYRpj4017bqcfGTBxKg8xNfWFhk7g3VHDHVyxYhKvC6o1+hF+EXbB49Of6+
	6E8DW5h7mq8sqco6GjcgyRfrXo/63/Ex2n9VgMCEkevTNR2ZbUnk/F31fpkO8cvGkn526AJsWls
	RrM0/nA/qLBl5y4/FQoBXTLfMFhXKX+fpDx2nUJg4DbgCIqBKx+y6oQGQpcgCWmeiXz2tp6jE+J
	YP9MDAntXcvzttbJE1YBM5FFmLOTD2kesjnQRDIhRib/wl6dhwIl/wh/xQwDzSKn5UeAo6hZb2i
	I98TJkz38s1CC/viePJfCJTI6qz8r9qeeK/1fOVOKtr0hmEj5uOSJq7HQMz6K+q9fOGXlbXtCTI
	XV7bXDwGjrdAHbI5FJ5rvMqyQHtDufhHxERxlW9CrFZWKL+Gphq2QD5YYMLRlyVQwpAl2OG04wH
	BEW9wwCTrbuNi4JbBQVz2CcoSLfEpRpjoTo+3B2YmVQFQQxyeO1Vqfgohs6jcK3wZFnrILvTo9F
	4Agf6QcCP
X-Received: by 2002:a05:701b:4583:10b0:1b5:5915:bb34 with SMTP id a92af1059eb24-1b55915bd9amr9227327c88.4.1795417275345;
        Sun, 22 Nov 2026 23:01:15 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm25283608c88.15.2026.11.22.23.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:15 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: atharvatiwarilinuxdev@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: acpi: Get correct location data for Apple macs
Date: Mon, 23 Nov 2026 02:01:09 -0500
Message-ID: <20261123070110.11736-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026112344-jaybird-glancing-b56a@gregkh>
References: <2026112344-jaybird-glancing-b56a@gregkh>
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

> Please slow down, there is no rush.  One patch per 24 hours max.

K, i did not know this, sorry.

> Again, why is this needed and not just calculated at the one place you
actually use it?

So i use it here:

static struct acpi_device *
usb_acpi_find_companion_for_port(struct usb_port *port_dev)
{
        struct acpi_device *adev;
        
        adev = usb_acpi_get_companion_for_port(port_dev);
        if (!adev)
                return NULL; 
        
        usb_acpi_get_connect_type(port_dev, adev->handle);
        
        /* Apple's location overrides the _PLD derived one */
        if (is_apple_location)
                usb_acpi_apple_get_location(port_dev, adev);

        return adev;
}

And its calculated it here:
static void usb_acpi_apple_detect_ssp(acpi_handle xhc1)
{       
        bool found = false;

        acpi_walk_namespace(ACPI_TYPE_DEVICE, xhc1, ACPI_UINT32_MAX,
                            usb_acpi_apple_ssp_cb, NULL, &found, NULL);
        is_apple_location = found;
}

so its used PER port, so if there are 7 HS and 6 SS ports

And you suggest that i calculated at the one place i use it, so
i would have to walk the acpi namespace 11 times in that scenario

instead i can just cache it in a global variable like is_apple_location
so i only have to walk the acpi namespace 1 time.
