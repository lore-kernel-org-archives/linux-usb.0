Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784AA34C14C
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 13:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770731733; cv=none; b=QngXEtsAkHd4XXC1a4ZH5Ski1uVFDsptbZfJW6768xazTEecK3KjA+JsgS5pSAH9SIZpXNv53ZgZ+5sIwkDI0/IPRfqG4NqopejP7JBAlOcLXRXpTcVDqnDwnXnmJNxeKap4DS4grisVqqWUJ3Oi742/H6NE/+sKS+N5rMbl1fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770731733; c=relaxed/simple;
	bh=kGWMs7BC78EuklE0heMjMD6/9KNz/jCEJGk+6dk6BLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LAtv+M53WfBMoS5KO+udjO5dcqT2QHLn5uswvBjKxok2uCj2Swf67i39z3ncUaJF6nLggijLhKU3tTDSi42gVN0AOF13G3azfF7yFatSHKj0p+AY67/2Mp+WfpMcvd/hZVsoq3b3suhDaOfdGBIGWrFw4KedaWn+ugflGlDzFeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFzY7D6w; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFzY7D6w"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59deec3d8dcso5823968e87.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 05:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770731731; x=1771336531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l4BqhYxbrOdmnGDJKyU6ym9y8QvvYWCcM11vjo5EmnI=;
        b=lFzY7D6whEVn4DbDqmQAiemfASO6Q6DOMt9HfqzE5kh1YjvfmIT33U3VKgille1FfX
         sZKrRJnKk28w1cdel5X3k+yiZPmlRptjakCYkV7BcyoWAM/uBdAsZiFRO2v8sxbyEapC
         824oZX1qNW805/eFAhGsXTUSzgRc7cO0ZbyWaAZTWnqruGDDFHD/M5i0A1wnPHYVj3SB
         EyvCx0IIFqlEHUrmWvAsX08uTq1W2PTm16OjZQD2AG2QWLOPLdQh2gfGFj5WtO+Wgc4E
         lPG7Wic355DUB6Mj8NYN6XPLhQSd2yJyN1YJQYjcP9+KXfM9xowcwgSxNOTi5etxDU0U
         z/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770731731; x=1771336531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4BqhYxbrOdmnGDJKyU6ym9y8QvvYWCcM11vjo5EmnI=;
        b=YNzq+jW9uCXjIHFTCHzXlt2tIqvRpv3SXRgm5KOhP4jJkExRPD9v4djhE+VcQQ0+Wr
         2d2OmK0Sa8smAPD/pUCfZQnrchhhS08VV3D3B09x/4dWvxN/+122BDraw/7Qy0Pz9IN3
         nJfy0O6VQ0zE9Ibp/VitHjGy2FWu8lZx4TrCWk6abyFB2NJyikp0XcVd8OyZBjhswE2k
         EG+o8T98TVcv023BtzI/CuKof+y/oFxefdnmi4NhwSpDCJVw+GZBsAxUXzSLw6IpQeh/
         U0UKAvkofV+CfEi8fGh4uUHMgUXiCnR6QFdT3yLHwfnM+CiOu94VXHBDsWVeTYUOyrov
         GLPg==
X-Gm-Message-State: AOJu0YyVMvZGHq5f4qAlS0qBSQKVGW+ln2YH5tbx/3mIMA1quM92E9zi
	opyNXzNGQhsQ6vGBFJbvHk+cG/geAxPk5wO6c1rlyss3bkWjuW/onb0/
X-Gm-Gg: AZuq6aILdAMg6P+RdEk/RRDkiZdVtQHpUlwewEMC5rbjD5/RnbzYR+5onV24VOtbtqA
	B8K77EVlRwQAKUoCrNSC5/zOHWUrr1bza44Pk03ZkTglG5Wgl9fQApXkpjaW/4PmDf96+SxbMRy
	eLlUU0/E5TMdmh2pY3SveEjJfMyFmyVwDsusQuNXuIJoiueIURMXSlfK6EKOC8OwwA3VuLV/MCu
	LstNEwABkAKsTNNu3rpn/Mt6L4I9XQ5ERmhIwdBM4i/d3VCRdeD1qYdhqJ023dcTdzeTg/Is2QB
	gHimueSrVme6Oq8apVusfjuzSZprQ+XfsVEu0Zt9sn8LxD5VIRP/47Ir1f3VUL76wy9x4a7jkod
	BaMw7SN9c5pqo3HnnzYaBwsfPeX1DM9G0uc/RPEQ4KjE7eACpchRrsmqzURxdP/5S+h0EcrEoxg
	9Sshv8j7EB/XwnoIDsE21EaJtbL2YUx4uMDAsETesWL4fxt8oiYi8S6uh9Gu2JSPbQ19sPi4Sld
	AezpDmnqw==
X-Received: by 2002:a05:6512:3ba4:b0:59e:3970:5eda with SMTP id 2adb3069b0e04-59e4514c1f4mr4405841e87.12.1770731730535;
        Tue, 10 Feb 2026 05:55:30 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:4341:e63c:56b3:c9fb:1b7e:5017? ([2a00:1fa0:4341:e63c:56b3:c9fb:1b7e:5017])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cfd2aasm3345293e87.26.2026.02.10.05.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 05:55:30 -0800 (PST)
Message-ID: <77dd184d-97d1-40ee-bed4-6772c625016d@gmail.com>
Date: Tue, 10 Feb 2026 16:55:27 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: isp1760: Add missing error check for
 platform_get_resource()
To: Chen Ni <nichen@iscas.ac.cn>, rui.silva@linaro.org,
 gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com, balbi@ti.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210090202.2332349-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260210090202.2332349-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/10/26 12:02 PM, Chen Ni wrote:

> Check the return value of platform_get_resource() to prevent potential
> NULL pointer dereference when the memory resource is unavailable.
> 
> Fixes: 7ef077a8ad35 ("usb: isp1760: Move driver from drivers/usb/host/ to drivers/usb/isp1760/")

   BTW, I seriously doubt this is the correct commit...

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

[...]

MBR, Sergey

