Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7B53546EB
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 04:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785472815; cv=none; b=LJIPsYQSDd5xAvMq6CQcJpve8olQOmakEyxp1bE3qtDqm5dOqsNTNSfO22O3su4CysU24v3GujnEt5BPsSDjNBHCKS3CMzmuXQx0cCKHj9kUgSJPh0I4DezzHuo+4F75/fdsCICNY7LKZ/7xLRij03CTt9slKHN/doKCMLyx0sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785472815; c=relaxed/simple;
	bh=Tx5WmF3XryGiMbBuMhanT+WCPlnUcf1UK/6cuvejFps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ta8fuInDjsw1ka3wLdyC8v2KUe6EcOaWfsW1h+XqSSTQRDZuroeC0va9m3cHLKS9QFopVRTd915i+qGFYQaP6qe5AD/JPKoiESQDl4DBZhpZPdDTD/W1XHt2oJ3gZ3wVuWvI5jsRbda3hjOobzeS/iQnyldpwM4wjs9PePXxR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UB7c4CS0; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB7c4CS0"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6aaf3f54dbeso265488eaf.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 21:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785472813; x=1786077613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tx5WmF3XryGiMbBuMhanT+WCPlnUcf1UK/6cuvejFps=;
        b=UB7c4CS0v1ZROzHruiuCRX024kRSs1I8mWmQN4NsRtWQ/ZPgGTCh6rENDgPyNTZusQ
         tSwDJ1hgbCK1HzEMb0e1rkmmDpRsY+rcMcetsSlkqOzWQEb+pasn+sVAsWJeRspCTJqB
         hRwn2dPHmne6Z9eXmS5aPcMm6ccxJV4ioY8VuNmcwwihXG8aLvVcgZgHlLlZ4VcHRt2C
         aOlVr0KYhmcpGnVoB4OjwyPEU+dv7L+fxFKOEtUbzsF3FHMLwEKZxx2d+19ThZHP0DYn
         Uu1VTkHjvYrv2c1bZ35K/PNaA75DlGXzXTSFKKHrhFFbnzpLprDW7fSrpqH+WJ4zV7pR
         c10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785472813; x=1786077613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx5WmF3XryGiMbBuMhanT+WCPlnUcf1UK/6cuvejFps=;
        b=l96R19/DroeNgk4hH5zz35wmh25seomTmWa4hYLGO56hPv+UCLWKmEVCHThfO4EfDE
         hc9cYgV1yWK81bB++fi1FUPRZcXhv8gwvi0SWIrJArLmL1PezHkRwM0tvBCg43el8GjD
         2gt6N1OLTSzezEE58mSawLwpdGcpwHK/NkYtkCWZIJMPhNROfyDAA6HFtzq19r3ZcZ29
         WoqMW+rEACA08hSHRKJr+wEcIehbty6K1nvt97em9z+WFdQTE4DPtvWiV5EcIUKZH7D3
         FDj2fRh0OQaLdgwQFl/C2HjzgF3CYX2DVNt686ziLX599fOhkE0aWPZg7UeJH/cvocGC
         Uksg==
X-Forwarded-Encrypted: i=1; AHgh+Roi8aq9QeCtzbogyieb38A7G5xVfpGWfXkxS28c9GSIUOJrchEq22R9fYnFr4uEPRpK1WAvSXXI6CE=@vger.kernel.org
X-Gm-Message-State: AOJu0YylVibe6qjOxpd0bpGKi4hzVL4GQqvtvX7t9l3761qPeQdLVJnm
	8HvlYZ1kLp+befvpuQNiTp1uLTeyTeq7DhB/BpNs20/wj6gWpxkJV/eb
X-Gm-Gg: AR+sD12bcXZkNqlXqoMc7j9FNtUqZ6oDzGZwzy3+dpI6MQV+AtYOd7A7Z4Wyndp3UAy
	2Nkt5q8dTrB1bv0sxUWR1XaBbdepJf20ox5s0kB0MaEDBXDlnOGi5qgVz1Ztovu975ua8B8pFXx
	rFXnqXAp4XYlhBjsF8LLdjA1A9ECmxAkQY5TuW3TcShAJhrUz6O/VVp2RvsKqWhaQlWZWdaLmO6
	gwl+pjswoMn16xFppKWSsFAkH/hm89huuk2ZLQ5Pua+jssXC1LJR+Ei56BSvoSD2vHjo69WztgB
	Ez4WQAhKbzZK2DqPPmz9VkloaYOUSTC2w9aGTlsgBJgxUL/8+dZD1pzD72lrJlphEEZYihOPg1v
	JDtvRajIxNj4V8wmBeCnqBXVB60A/4tCILH8SmyJSvo6rPoz2hTh1F/b5GmFueiLl25S0uSccGu
	YhTCS63nxqY//qMrhHP21nl3HtiwbKoi1aAs8jiwJP3eXjjv8qtXIPvLKGShSZW3jwbDdh
X-Received: by 2002:a05:6820:4c0a:b0:6ac:bafb:bff5 with SMTP id 006d021491bc7-6ae37d887c2mr312568eaf.11.1785472812985;
        Thu, 30 Jul 2026 21:40:12 -0700 (PDT)
Received: from [10.10.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c2a5d539sm4218232fac.17.2026.07.30.21.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 21:40:12 -0700 (PDT)
Message-ID: <7792f017-42b0-4a09-9941-5259138e21b1@gmail.com>
Date: Fri, 31 Jul 2026 12:40:07 +0800
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
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <CAJZ5v0jByxtQ2tmNm_ZyyBnDMBNjuqQwD_367NRyGNzF7wQtRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-07-31 00:16:27, Rafael J. Wysocki (Intel) wrote:
> Can you please check if the attached patch (on top of the current
> mainline) helps?

I tested v7.2-rc5 with or without your patch. Both of them have the -110 error.
Note I add "#include <linux/pm_qos.h>" as the patch does not compile.
