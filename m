Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713897;
	b=dCGC3MnoIHdN1hSIu+dA7TxjawHFY1W2u+CRsC/4LLkOZ5WMkUnv+d+H1qGpw23lH0N1
	 UQYCEV5OR2YnJkkT7vlzdA01ZkZe9Q0S/pSFsPT3/GTnhayqdP6WO60YVaE0U1X3QlfVT
	 i++4hx9HBukPNDRBaM1zQcQ4aAs0quqlR9KN7ILK2QzaK+QHdkOOC7ZZzWq9Krn/vQKx5
	 xMHE+gOYqZUr4Tv7VkT0+oZ0bwyuBBB+6dHAc3DUXTMDkpr5kT57kVrO9akozYzGUte0/
	 CjX5DME9DKNRweb6bmWwDDZS7OqHorrCFGcSvtr7zdK/SQR+4z3e7YDu/GGB4WJUFcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
	b=wvIBemRIR+aHt2t5RJ2pXZyBSbXD0r0nQLlJj219DoZ+PIAfzDpTPcfXQ9V5bmnL8BA3
	 LVEW5XBYws5Aq62cwIRgQ95G21/pCCS7iSbSfI7xHKMuIpF2NVvbAkGH5hmGNk4LPdIaG
	 dc9b7hiyNEwIMD5BlH0Ly+Sj5KxOWa7sgGCKz8TkFRe3D4kG12zZQS7vR3wmnFLabii5v
	 UewaEE5bmMA83pnTIc9T8f8tZgCm3xakJYPCTntIEsTafuI58zc2T+5BlctRNsTGvV/pv
	 DTyBriQsfJkCLpl0DLooM34T+Z863JeAtMvdzA2qFZPomzOBBU5Yxg6g+K66f6h/c7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIBDzcKJ;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBD9606A33C
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 13:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCBD9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIBDzcKJ
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b244fb7fffso11281c88.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 05:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713896; x=1794318696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
        b=mIBDzcKJhns27qPQuV9fTSNMWAJy5I0qPLMthCC9g48zICpI3YpMKO5EHSiKnVe6E+
         uxWymqV4VpgPfeX6fTuM7YjQlwLhf7OellePlZQDhVjzOIkn5zBPbqD0lFRGhVDkVMFw
         BuRy1wjXQa5QNXEphT1gRs/kPWjz9RByIvqB33FtAya1PAw+olxxve762cQvyU2KMm7l
         9f8aLszCmdt6evvxP3UVh5hGoIF+iHWEK43hLl0KmIvzqCKg/vzbhKoyuKcZ6yBSuqFU
         UB0fJ8QgGrvUA537lqglqXCKvHYVqwVnYb6pSZUcNGGmq/Iafdu+fPNjLv9CrG4JOe3s
         60tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713896; x=1794318696;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
        b=0Cy8TAHmQ+4aoxrla8h502GulyJ4LIlPlQplwgq4r29vbm6EeAibN4UO0oq0Rzuhg8
         arpc9PncrtDqxGXDIeDJryC6rkim5SjdXHlYwjpBQtDd6LJj/L/JQ+hopHJJj8YE8Een
         Qd7Y6hfoaURRahwwb3/lMKE7GNCKAxjOQOzduWff1lzRwXAD18SFJEy9ZQhu+W3k2Zwy
         5dLcYNidwdGwrn03KaJ/eFUB1Nc3T1dZ4ikKgo1ryiWLXwk8f3ctGpTHm6g1QhCyq2z0
         pKDbaAYOODlO4mpSRT/y4PRSKTzdlVRu6ONX8nK/b8yn4axHS4UJUBe3X8v+MzUIt1Gb
         DzBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwP8nzKZ8HL7hu+VGujbDEVWxPT/DDs8lIWuVK5JtTpYXK+R3ME+H+diuKaoO5epQdqBO+iCE7NDnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IER+cuqYofOmHsfLaOzjOkelhjccdCYxYkhgKhDAIVa+YgbZM
	r0EP05AymEvX+O3HcRDQMHmUu+RP30kTgi/qF0pDY6TgOIvDpdyziLgrtQLpSVjdu0kdEA==
X-Gm-Gg: AYBFou3l+oVJOw16EodNENhmpTDzVcK7y5cY4GegKjBhc/chK+wWl0aS3HJ4DW1P9xi
	FnkKVCA6u8Kx+yCRHf3p1tSUsr6NhMNgZGrw/XhKZpixs8rkU6ABIlzDB1pUV42q9EB4DykSECn
	CUoaarFncnZrAovM/2JKgrV2mOUeo8O0TgGFnck/Bd21iQ/8FBsI8ahDktwkCLOC1TOCBNBZrNe
	JCbp+0brTejbExH3x7mB2Sch7PAWfDJiWkeJQCChSObr/fM/tWXIyPRlm1iZKoFfbvTGOXC1hbR
	DNVgDHbHvxr5jhX5jjX6YckbhSJkEycUwaauVLWZY3klpU/13MAuVclpyddf9EV4rqYo899w35E
	GVed2sWBwxcy2qGq7NOGTg2tJOxrsXtIqL0RIkt5g5Gda4q7Vi7J5ej+0MKxIJGBZMifDBiR1sg
	3fkZFiFL6wwtSCbtuDg+jDpzXhMpdVCdvxxeF3mCJAx42yfbFHYSaijEVEFifkmurNej3iBgh3o
	WjQlL1CbBNLUmx5xFJDJcNO3eONHJyx2goXW5DzJBLrtOw8g+V25kMAR6/VFeVPkdYeKr+iYdMN
	k/CzxQWcLrwCgPJXNWA+o1SKUaF5hFXg3y5fWCyZoLYQ
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18652995c88.26.1793713895766;
        Tue, 03 Nov 2026 05:51:35 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm41742846c88.23.2026.11.03.05.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:35 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Joonhoe Kim <26rote@gmail.com>,
	sashiko-bot@kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 22:51:35 +0900
Message-ID: <20261103135135.1977-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-194270@kernel.org>
References: <20261102215121.738-1-26rote@gmail.com> <20261102215121.738-4-26rote@gmail.com> <sashiko-outbox-194270@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joonhoe Kim <26rote@gmail.com>

On Mon, 02 Nov 2026 22:15:59 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does adding mode-switch here expose build and probe regressions in
> drivers/usb/dwc3/dwc3-qcom.c depending on CONFIG_TYPEC?
[...]
> [Severity: High]
> Can enabling the mode switch on Kaanapali leave the controller stuck on the
> 19.2 MHz UTMI clock after exiting DisplayPort-only mode (Pin Assignment C or
> E), breaking SuperSpeed USB 3.0?

These two are about patch 2. They match the review of patch 2, and I
answered them in reply to that review:
https://lore.kernel.org/all/sashiko-outbox-194253@kernel.org/

In short, the CONFIG_TYPEC problem is real and is fixed in v2. The
replug order is also a real gap, and v2 switches back from the mux
callback. The in-place D/F and missing safe state cases follow the
PHY, which also keeps DP-only mode while DisplayPort is powered. This
patch itself is unchanged in v2.

> [Severity: Medium]
[...]
> Without mode-switch on usb_dp_qmpphy, fwnode_typec_mux_get() in
> drivers/usb/typec/mux.c will not match the combo PHY, so the USB controller
> will switch to the UTMI clock on DisplayPort pin assignments C and E while
> usb_dp_qmpphy is never notified of the mode change. Should usb_dp_qmpphy also
> have mode-switch here?

No. Balaji Kalkonda's Kaanapali DisplayPort series adds mode-switch to
usb_dp_qmpphy (patch 3 of v3):
https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/

The cover letter lists it as [1]. Adding the property here as well
would conflict with that patch. v2 notes the dependency below the
"---" line of this patch too.

v2: https://lore.kernel.org/all/20261103135057.1682-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
