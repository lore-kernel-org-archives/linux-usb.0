Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977FB36DA0D
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785503184; cv=none; b=kVG3JdbxRhScJlyTNcLMB6QXHJXpQsP28PHoIgFvnRCtna/rPrRGtWdeRYGaoMhrYlpHjEe7rQNDv8iV8oqQcIuYA22hKvxoalELgRFZYsL6UOahyYr/fU9iDWNlc+cWsdEOVMPrcVnU0RVyqHwAiGUTFoMDAwi72V4acvCBNIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785503184; c=relaxed/simple;
	bh=/72SslYpy2PVQIMAAmadnePuVCvoy+6MWfdj9ZYOdZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bp11whkakNiHYDzUexVmG03Ow976EzA8jLolfDzABT+6HZ7udJSXfbnM0ilKWgbFUCmy6r4rgXcRqSz71eIdsg8JoIPLNQOgcvU0lE40WoH5744aBIXw4ghxr0d8Qic89pz/1zeO+udjAa245hBa4om/Xu/SOPsW35F7PfoiYrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHygtYvH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHygtYvH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc73e322dbso7921855ad.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785503183; x=1786107983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWMr5EOxuzjVi5gwglHccB0LsO3CP+DoymMW6cwNef0=;
        b=pHygtYvHx1RtSbKvbmO2VWEp7Zl0b7xsJ/srCgu6Up3Yyuy6qws2EP+Lx401I81n6W
         kbmKuHdIuwGiQWsePnfVIch1zuFwQaVhwr/+b4R5ksp2izbK5dVSb5waca5pWbZOu5iq
         59t09lGDzqjRtOStDFehbVG6UouLLBTbs3NoVEalgZIu478AyOVe/Z4dHTO84qgX/9H4
         xXfeWm1nVA/gJ8nnur9H2OUQTKonmT+YYf/cdCQEygpexo9MQfM7Q03VP5/f+wAAeQY3
         SSuUWM/JoruOl6NuXyilXCHtE8/PpXBOb4QTQGmBwqx1NAM384u6Jp1l9R41czqJgJnp
         VmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785503183; x=1786107983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWMr5EOxuzjVi5gwglHccB0LsO3CP+DoymMW6cwNef0=;
        b=ebXcghohJcBjUsiyyWbgkr+or4VInagOi735PyNzYdl0ScFAO68uKrRS5B1GzCou3r
         xoKXeI2xIGKZSQnSQDZP9D95Wx//BANC25ScnkdOtm1s9yaautqb9cZpMewJevgr034l
         0pnOjXfNWVjY/oQUrroyOBRp3fQzyv87Ahn7TjsXcnADlqwIsO1yDeGJCj5YQwMniCBi
         th032iowbwDd5Kt6AwPr9pCGLVqGSGMrT7AfCCvAuQqxqHKbb1a9i3g7Tvyu5GuNb5Rf
         WBo2fq+GuJ5srjRYMBl4ha/WYtZypuc+TQFqabmU+m9CJV0Iamu+NvjMmpJ48YWR0io0
         7rng==
X-Forwarded-Encrypted: i=1; AHgh+RotWzi+JS+nrhlWSs6ZDN+j9DjPjdh9ryYtfZkUEl5I5n+pX7Rkhm2nUmC5aqoasdHTxcM1OLIo3dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyibURAO0LFDmWME33WUhH14dsRLxtvxh7hEW0Ac4yz+5odTnV2
	QnDO8Vz/cQupC/OBn2qC7Yj/2bHZ41m1SS2AxUmB+vnj1uvAtTv1FnDj
X-Gm-Gg: AR+sD11+eIlsDoO2z+a0fCrlqbT5CG/hkp7j8torDexivRh5oWkS7u2NntOX9koZ9Lk
	Wl3z31HLjL5OATtoSbp1wQh5IBz/ZQPMZEJbgp4Lc4JUiTtg5OXQlklpoZYK4QJ/Sf0AOhRFX79
	0DymEKOcSNBUtCer2yuR5LvrA9NNaIGuhTzW4EgBduYzywS96v+ByIpt7F5PF5JXI/WvxtOW6zy
	gq5Yozy4d3qaVi/bbcBcxsg4lMsrCJpaJOJEitVIhp//hrkG/jvjmhhPorI8gVInRfrjLqtFmag
	OPsNpRhZgJQR6hzJjg0XXydW/f3DWuJxe420u8+I/D5qZnmMlFFLjgVYtXi5CT781d4xpZdgd8a
	oPafO4i3eailhPcn8a7eyJ0l0vbuNyumQvMGk8XGPeo1r9TjYZXOLeCKWZx5J0CsFp3aJSCJxbN
	KkEOVtVnQi5QK0yFXYBtG6aeiG3dFewJcwY8LhS3Aut3GaXsptJfUMNhnR7A==
X-Received: by 2002:a17:903:190:b0:2ca:ecf6:9104 with SMTP id d9443c01a7336-2d046d81079mr19211725ad.4.1785503182834;
        Fri, 31 Jul 2026 06:06:22 -0700 (PDT)
Received: from [10.10.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb491sm5193715ad.42.2026.07.31.06.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 06:06:22 -0700 (PDT)
Message-ID: <588c2e18-e6fb-4fc1-95d5-7a5dd0f556fe@gmail.com>
Date: Fri, 31 Jul 2026 21:06:17 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
 <daf0bb9b-246d-437d-87ca-16706113b201@gmail.com>
 <CAJZ5v0jByxtQ2tmNm_ZyyBnDMBNjuqQwD_367NRyGNzF7wQtRw@mail.gmail.com>
 <7792f017-42b0-4a09-9941-5259138e21b1@gmail.com>
 <CAJZ5v0jCFFNuG7WtCE2CG+hP=YNsYMdXH_945QgkgAUcr4Lryg@mail.gmail.com>
 <37daa35f-06aa-49d0-bf0a-1b5ac9f44c89@gmail.com>
 <CAJZ5v0jyy0+hqU3=gmBrgMzLBVhdUQwDj8d0_jGCqZwqyWT=_g@mail.gmail.com>
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <CAJZ5v0jyy0+hqU3=gmBrgMzLBVhdUQwDj8d0_jGCqZwqyWT=_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-07-31 19:58:32, Rafael J. Wysocki (Intel) wrote:
> Please boot with "intel_idle.states_off=16" in the kernel command line
> and see if the problem is still there.  If this doesn't help, please
> also try "intel_idle.states_off=24".

"intel_idle.states_off=16" does not help.  "intel_idle.states_off=24" works.
Note that the test is performed on vanilla kernel v7.2-rc5(without the patch).
