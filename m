Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A328746E00C
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958469; cv=none; b=nwwK3JAS0LWpEPIiub6CLJj49nRUT7V1GMD9q9agVtfJQXdjXowiD+UY/gghKTVQlfzvVTCa1C4K29gVYa6ejY5JfM4sN6/hO5bilZbOuih4Tcd7nwn4SVlD+v5wFDXrf/k1jvJA84XSIHXugezEw3YBY8thiIfuaEGyom2KMBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958469; c=relaxed/simple;
	bh=xOyYAI1/Wv5vq2QW2pU95SefZ1jZM6HE7OktZswxXr8=;
	h=Message-ID:Date:From:To:Subject; b=cxpXI9MCX9sFYpW6ziaApOx+4pTo27ZA8YF8hPUHk82OP+wrFX0nEeI+lpKJo/ihPwrjV2iPVCNP3AzgvOv3UN/GPFnEozNqtYUP1jkhvQhVqgwPB6T25u2kCMMmpDOwo957Im9ta6Z8+DN01IJzEIT86hZ68xpA5ShCT0GGLn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGn1nSZX; arc=none smtp.client-ip=74.125.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGn1nSZX"
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-341c6390fdaso7180691eec.0
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 09:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958467; x=1791563267; darn=vger.kernel.org;
        h=subject:to:from:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xOyYAI1/Wv5vq2QW2pU95SefZ1jZM6HE7OktZswxXr8=;
        b=nGn1nSZXJNRtI3G9BTPXnBJ1ZGR2dfmb8CM5oBbhOK2/NU3MhjQLOJHZ99492EXoak
         21pDoMY7jpTxsDKnleCSwN6gHyBK/oYJQ2cBLoTmhpBl47PGDrQVO2WydqwyahHt57b+
         3Aimfu4cBkKJeoG3YaxFj2or1yDS1fBQI80RUHzl+b9SD0ASPG/zeua6YWB/eOvQn/ci
         g6eg+xcFOgERAC2G0ErsdyjR5STDiNbv3HGOcTjbzQ23bh1/0y70nRaItu6DGl+TG++W
         6ybfiqPue18SzZw8p7Cco6rr3l0x9muF++v2ESlPV+tOEXpW1NAA742LYIiC5nDZXWVM
         BVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958467; x=1791563267;
        h=subject:to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xOyYAI1/Wv5vq2QW2pU95SefZ1jZM6HE7OktZswxXr8=;
        b=t3wMtgUAdLPpMwVJ9HakagZEu6cs+ZE8XsXu/WACIf1bmdAVsKpx31E57Xf3GPg6XK
         OkQQnJylclB0Z98HTMxnzCheedFnOiMkcx4ZJotVPnSgdLQtPcsNe5GxQCqTFmZqyPzE
         fT5P4fi6S/LGn0RZfDeIcOHN0XE3YOzCZseeEuX4x4t7AXpTPg/6ajZSoy2AjhjM9c/9
         J6jgdAwp8Qkpdo32hRBrP+vcoEK9+sSQKwxtaWygD8BI+GBfhH4cTX5OHpTm6itWnkUn
         IdcQE3ZgxJkbtHvlLSiunbBNpKORqSPdQWT+4mliJfXRa3O82KnrUn4h40qEct0S0KKT
         E0JA==
X-Gm-Message-State: AFuF++nuQgftIFn0V1wyxvc/LbV1/yiXvmoDnMUVgbPhduBxIPObgG0C
	CGbYcANg0R/M/GgWjxR91av7ENfaeE5EpkfcT2rneCw1gGohBMCB18FLgvTq+hlW+kA=
X-Gm-Gg: AYBFou0ajGXISpN7PaoXrJ039nDtYqngvJzi+Xh1hUK7+roPG3rs6nrfwU0DOohlTLR
	E6j+fjKSCUNBvvom407Xrs0Vwt2ahlZo0iCGF75PxbCt5z+hImINRVVasgYpOmXXUtkAuovYytj
	LqNBA5fDU+3WaTOYapk5oZPEb7onuXM7DP1oowDDCjtBAs9aWiIievAwBrGMOaDl4nCwOZa9ZDU
	TuVMoCMGt+HtnucMrbEm+Vn6w5qPiSY0A+0Mt3IkQYpo2QXnU+HXl/R52hUJXWPyEhch0ZvnD0v
	XLYqDKl3HTpG6n3EtZJbKglIcLOPwkkVJQ0I2OeI/1iBE4N5iFqaBEz9uFmsxSSadaGLWWcV2Cn
	SS293K7ICr4lHi6VNYI0WaLU2cYEeZCyy+Nv/9yIhLiVZpl4rmvTYChX0TO0bVVNhpvLuvBVu77
	3o+xtTJsQNp0/ISrSAreKqqRlcdKYlQnzv+g3oZtXZA7D+QXbdA6DGisYgqzw2KN3eam0dE7TwC
	G2WS3eQGFum+wLw57uY0fUrg85j/lVnajg=
X-Received: by 2002:a05:693c:69c3:b0:34c:1692:f2d0 with SMTP id 5a478bee46e88-34f1509e5b2mr3239651eec.8.1790958467311;
        Fri, 02 Oct 2026 09:27:47 -0700 (PDT)
Received: from localhost ([43.157.187.250])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34f14fdb478sm6901097eec.22.2026.10.02.09.27.46
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 09:27:46 -0700 (PDT)
Message-ID: <6abfdb82.a8c15849.1a8aa4.93af@mx.google.com>
Date: Fri, 02 Oct 2026 09:27:46 -0700 (PDT)
From: pidaripidari21@gmail.com
X-Google-Original-From: PayPal
To: linux-usb@vger.kernel.org
Subject: Billing Successful | $317.71 | Ref: I-WB4JBU0KCTP08T
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Subject: Your PayPal Renewal

Hi linux-usb,

Thanks for being part of PayPal! Your 1-year membership renewed automatically at our special anniversary rate.

Renewal Details:

Service: PC Advantage Security

Customer: linux-usb (ID: UID941838)

Amount: 317.71 USD

Need help? C_ontact u_s: (859)-340-6239

Best,
PayPal
(859)-340-6239
