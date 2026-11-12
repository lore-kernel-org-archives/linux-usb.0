Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483634;
	b=oQekFEIQMEXbOPfXRELVDOrfOZpElc/arWgI6TQektkEXfAIMq4OcP3/+39js2/yEICM
	 p7UHfLx66DQSCghwErM7W013CpEC+rde3sArNdLH9exuCLYSqD4bEJu7ufBmt8yFL7YR0
	 e1BUX5frLj7v8sIUVq1mIk/7yUg3bRB67kbGc+N/4+XvO8XefwL+QpggSy4mEf79bGYSp
	 hi4bXluboAgMPr/HG9J60cfFUpD4C8Pigyl/n2FMC6HPJSvfH87JQ/n3ZhdzTwNYXqQNI
	 akUkWCJOmhfqALoGjoTciw7uVMN56rIQTrHTbe1JrEqzsgW5Wjcha5/dnh/W/3Ep+1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
	b=jo2mFXJ6nPl2pt/vXdWzhN9fD/BScs7HKOx1Veawe7p/bEfr3EE/BaQuK56MSZs515fV
	 cd+OtdTWswv8Zb1oi6shKXQTI1f7QOUdBK74AZIcR+gGx0RqoU03iXcLKJcj3w+4A2Fl9
	 KQzqtWluDS4oDpIeVwmUZhxYnIUaIOhrwIQabiEmXPbsr24GlxzmyeTkCziVEgadIxc0c
	 +ltCQ9k4yoPATC4bvgVUL/CTBOz156UU56dzIRpcal0x7/V0chw2EhtLAktocL6C7Em5p
	 j6n+TNZ+cKtu2EXHHJzC6HOYuWu8U01r6KdKIkGYzRo+H1kTtzMk8/VsYKHqpc0PqOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tge4VMtg;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9590C606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9590C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tge4VMtg
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3712b6d9843so4046811eec.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 03:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483634; x=1795088434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
        b=Tge4VMtgjclRf+pzqJS5ekHgrHrSCeLOgPSO3I999bp75xcBC8b3SPuoO4TVQt9GeY
         6Se59I35oN6hfE9b5PLhIee2YiKtCwceIWizMYngrlh7z9vW3d7YavPI8yX4AebaEZ0P
         fWAB8trYbj0Fflmm3fLqp5E7+zLtbrlg1qmk3/kXZmrz9LSvVdFexcJv5nGVaqC+1DdC
         N1yjB4y5etDTAi5yPr4dyF9bo1YYiLge3oXQeDooNIPtCXIFY8Nws3bpcE4aFuLbLBfd
         qXxh88iCWKoA2uwCJN3RKMRRZ3++I4a+COuyC9whueEG4CmGqfByH/mAk9dGAeIU1d63
         WqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483634; x=1795088434;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
        b=umYjeUMAfLEawLntnNmhX38A2ip2EYRAqub5VloviqmYjFzJgELSx2A9oaDaLo4a1C
         p56Tq3F8QMUm1FBBevCa4n1lUooIl/FmVLwcT+F/zF3nUEvLwSgqBI9PI5UKjnZTHZES
         aE9ZrkFKSAPOrqSzHCOV7NHFlq7b5McGQhPfrzypmRpnv/9QpdXA1kyY/r1u34CTGr+J
         wRGrJ7oJRHGhC4kH0Zw3SN63MSBEjsKMu1RhZyarFC+D/4xYLxxy5mwA4rxaD+x0qZZl
         UQVcJo/5y5I/Rw0BZalEABU3qQbIe5WEH8w0V7fqr+gOGEC4lYMPT7KdnI86yT2SuIE4
         mkGA==
X-Forwarded-Encrypted: i=1; AL+hErEn7ykbqEI670bwyd8b8vKjH95I1ho6I73goRMgbC+0uH4UyJ2OWXml9JxRvLX8uPqB65OyG2frG50=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VqH6zuWPY2/QLA0t+JpECEpKdaIi/xOgFyr4p0SjPuH5dtTWy
	fxf0W71cI1kZyxMrCmDR3KRFEkJX1TndXcHDmOjfWrEzvWHNH+brlhgJ
X-Gm-Gg: AYBFou0Q8iS0FT1bFF1qxjRSnFOJ2RguxHt27aPOVQsEbXYmw3QrBg38Sq+k8yKTgfy
	iBrhlu3FNDz8tCFIZsimeejVLW0f5fp95xvfr6D43p5Vt6h6s/Y9ld7IKcIdwPAWI26uo8OTJGg
	pQSbdsryGW+9yJHwikwMCnpbHUVy7uWhsm21ETLe0IiJf/GWmTN5P+facEWoyaVL5/2XNz96odb
	udHmQteqS3e2kGp6/T6ZvOA+a6e0X8hBX9GzkBZM8tXsJjxy7pgN5zO3PfV5wHwz9Q4pKCdm5sD
	vYFAxUbVgnKojEiAqaNA5dGOpMmnfNu8ui7vtXRy5Tu94W/lhYFcRk4KxxZF3LG3/+KxLtGyNgK
	wTN2dZcjS/VD4e9aZasz5CkcVVTn4XTWGx6Jc50T1ACrjhFIeeCIRI8bSCDDVEIeV59WA7qxmH3
	wPjq+xwvfk0rr8/2SRtE7N0d3U1kjH2HWFguTwi/H9RYMUNIpS2KP0gblKJk+R5RJky2HYLwpab
	/9N32Wjd9nekCiCT0lxHVckfV0XReOGoV4yxO8NKIncQBpWL/BW8I3VJMix+6x/qKxwqZjI460r
	iKhZ5CWUqjKgMYEo5tMcjL10kN65FNsWYmqp7v4xmg==
X-Received: by 2002:a05:693c:8344:b0:369:535f:4d12 with SMTP id 5a478bee46e88-37683188720mr4399109eec.3.1794483633595;
        Thu, 12 Nov 2026 03:40:33 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23450944eec.9.2026.11.12.03.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:33 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abel.vesa@oss.qualcomm.com,
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
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 12 Nov 2026 20:40:31 +0900
Message-ID: <20261112114031.126-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <avUU-99gu3YbNA0g@vbox>
References: <20261103135057.1682-1-26rote@gmail.com> <avUU-99gu3YbNA0g@vbox>
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

On Thu, Nov 12, 2026 at 01:23:30AM +0000, Thinh Nguyen wrote:
> Can you address Sashiko's review comments?

Yes. I replied to both reviews, and v3 addresses them:

- patch 2: https://lore.kernel.org/all/20261112113958.166-1-26rote@gmail.com/
- patch 3: https://lore.kernel.org/all/20261112114004.182-1-26rote@gmail.com/
- v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
