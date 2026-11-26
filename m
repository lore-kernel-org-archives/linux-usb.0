Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734800;
	b=rs6ilFwNGzZ+XtGKUrqJZxAhCb6pUSxCD8iZHCopULwlKExngfXIAUv5vG5tSs/M1Ghu
	 U9PW3jARIPapJC3o52LO0m1DP1XY6+nzdfbMptR/Y0rug+4eCM47b72iHBfQQfylwN0l9
	 Ia4tcnQyR3zz9Gn/vSRj0c3MMR2hEQGNqFjRX1cwJYhQjw/Eo4J8KkXh3dJFlazyb6cuZ
	 X3z3EYfrYzx2g74nWWSp9YvwbO19Bx3UidXZmPOo1rSgkTSakyFeF6Ua+9RybSXCntLPG
	 e5JJsGl2HSbkUMtO//rTBd8QFFgpGLsfWTogdPxEVDZWC+ou8AlMz1y7sVdVKJb1MdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z9oKeq83DopfcyY48tMpJBUolAgSCl+fklUHPsTQ/7E=;
	b=PU3arI2CVleBkafFpOpF7SSSY5ZCdq3zKOPWATTA2mKptqKMWKher13kqKZYvFU3j1FV
	 LCDuY883L6HooXJUWGW+4MyL95OWcMUOW/tnuwTPzaKUjyvdHpYLvDO+dUeH97FYPkKFf
	 hj4M3PvUM6ZO7JNgJZi0d1xRn5Zxe6PjB+kCA3ED9Xd6NjeT69LD0EqVr1w9xewnzIwbY
	 hGmPkdNxcx4OJIIPdPzDPJzMdRnHOJduFXaqpgKXOLpD/ryIuug3LiZCJRR1I5MT+YpDw
	 bXjVtkeD+Ch80lYNrcYzlMHrjBSx6hLAFliIvFO+KICr+Fi3t9qHeZjAdF70vMTc9WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JHBO9wX7;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F899606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 23:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F899606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JHBO9wX7
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8425057c88.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 15:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795734798; x=1796339598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9oKeq83DopfcyY48tMpJBUolAgSCl+fklUHPsTQ/7E=;
        b=JHBO9wX7gqdhkoJohsMxVoW3x1/jmMyJ7SRSIwy8x3gYUyzzacKd1HqKrXV6b1L5H5
         HT72VlK2dkW9IzOl3rb8ty/4I/f6GEYtwE/yfbr7K4JiXc91gXDGLjBOHNi68i20bn49
         hAVo90M4h/hCilcDiQZDA3M7AV+cwzKh8npk9vXEZqXbCGwA/blen0OKL6LL0UoM2fDW
         yxG1j0hZYEncJfVicFWOetM1tC7N/HtwA/RAJN310kmTsfWWqOGWrqrgRD1PO9Xl6Zys
         sw/R6eJbY489l+QAJ7MEdzBgL6eTxYHjQqmRGSS1/N7qeQW7+dfUpmPjUmtKprdwoOYc
         pDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795734798; x=1796339598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9oKeq83DopfcyY48tMpJBUolAgSCl+fklUHPsTQ/7E=;
        b=F4SVckLQhLC+UTfiDScvUXwfSaiVieqrRmuvlEU65mjlOxhIFZlef/M7lz+bl9mFNU
         mBa5eMy9JheKlSn4zX7yimR6XrmYhYFfu2DyJ/ksQ1PXCH0KgD8jaXEvDdBdTk9OKMGv
         QUoe67Jc6vVLzt7aqV5leMXljiCMQpmAWJgCOLrAp4to9kbMEd4sNMQ3rwTlgkm/hYmF
         blA/Bi6d4l+D3qDeViHRklrQ1aCPt8/w2cZWiJxb5r2j9E/jPH+QNcjTEfYo8n9jofB9
         +hCxh5YwTQrF/24Xfh3iDsekM2gPxIq7z0SOhyYJqSF+IRPNnAs9jUx7ja3EEqsaq4Fj
         KS7w==
X-Forwarded-Encrypted: i=1; AL+hErHoAUVlcdDVngedv33TXk1fIgVvOIoihpSNWWepoVD7s92gc4IwEi4LQ4/6EuG7OT3kZR/Go6il7oY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8jN9Wxjp+WB6HhrKAEi4+qLT1MIcudgRj4swVkJEqi2VN5I12
	DGgl31QX6lu0fEVTrJm0vB8fcBgBAGnO+cjoT0yfgNeHzoaP39KAoa9jtM+7r+CKngnpmiODK3y
	UMfsuqK22Jw==
X-Gm-Gg: AZFdTZdHqROqowoU49rf3hsU/UihG88BGDNekuMG+CiKTl3spNTaYm89jD9Nz+o2efB
	4jJNe5EVSncIsGz14NyRPjHkpWhdUHjP0LBwr3Eb7qL5zyVbJlUrFrzDaOmIfFnuDrGM4LCaQZv
	fY4Q1tB0bjxZQ25jemqNq+Ux7eX+XfgSdgMcfE0ksRFpGaR77L55Q1Xl4Pa43aidYgounzHOWaM
	xjLYkHR9my9lWMRt7gvPlsI+XR2lkLsydaZL0q+CkRBtEcYTzheuAA28WL3SWZ+Stwphbk/Y69C
	I4yTF0vjm8G9JQ+IRnF7dojAahTk3zASzW2QqKYRwOyE1yKO46vBOo3fVzx+cxMVP5JzsTA+s3l
	M7i++f4bibyTKLY301eLIts30WvyFlkc8cFAoIMBl/coJxK01xcYW0tefabueXSP+a/YGE6W2UL
	5MG8pcbyFZVbxLWcYCShRk8JEOkFLpy/zeQ2d34SQtGnt0NqSNVP5ycLcxhQhKUua2kMgOFYZCp
	FJv05AamT3yaYSQmbjIyQMXQx9S72UghDkBRZvD0pFa5FbNDiFb7sU+li+Il1wMeI0VAjTrQrDv
	0M2DCGh3t6yaKqMQQ/XQxrRqw/EqpWSz31f/FrU86v+v8Ru3/6VoYpHEk3q+5aY8rlC4kcimikT
	jUFZMgqh1jr9irnFD122YSAm2ZA==
X-Received: by 2002:a05:7023:b88:b0:1ac:d029:70cb with SMTP id a92af1059eb24-1b5568c5127mr27239842c88.30.1795734797799;
        Thu, 26 Nov 2026 15:13:17 -0800 (PST)
Received: from [10.1.3.103] (162-231-245-176.lightspeed.sntcca.sbcglobal.net. [162.231.245.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm52330279c88.8.2026.11.26.15.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 15:13:17 -0800 (PST)
Message-ID: <eaefe02d-02ea-4865-b000-7d5b74da9f27@wkennington.com>
Date: Thu, 26 Nov 2026 15:13:16 -0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: usb: cdc_ncm: don't flush the TX timer into a
 stopped queue
To: Paolo Abeni <pabeni@redhat.com>, Oliver Neukum <oliver@neukum.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?Q?Jan_Kl=C3=B6tzke?= <Jan.Kloetzke@preh.de>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118034122.315979-1-william@wkennington.com>
 <7a0566c6-7a5a-460c-a113-d9463be3607f@redhat.com>
Content-Language: en-US
From: William A Kennington III <william@wkennington.com>
In-Reply-To: <7a0566c6-7a5a-460c-a113-d9463be3607f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 2:51 AM, Paolo Abeni wrote:

> On 11/18/26 04:41, William A. Kennington III wrote:
>> cdc_ncm_txpath_bh() calls usbnet_start_xmit() directly without checking
>> whether usbnet has stopped the netdev TX queue. Since commit
>> ad70411a978d ("usbnet: fix kernel crash after disconnect"),
>> usbnet_start_xmit() frees any NTB submitted while the queue is stopped
>> and increments tx_dropped.
>>
>> This triggers routinely under bulk load. With the default 16 KiB NTBs,
>> usbnet only allows MAX_QUEUE_MEMORY / tx_max = 5 TX URBs in flight, so a
>> bulk TCP stream stops the queue constantly.
>
> The sashiko comments look relevant. Also it feels like this is papering
> over the real issue: bulk transfers should not cause TX queue stop.
Yes, this was my original thought too. I have a v2 that just pokes the 
TX queue after doing other operations but that feels like it just papers 
over the underlying problem.
>
> It's not clear to me if there are H/W constrains behind the
> MAX_QUEUE_MEMORY value. Perhaps is time to revisit it?
I don't think it's the MAX_QUEUE_MEMORY value. I think it was a decision 
years ago about how the queue is stopped around link down that is 
leaking into the congestion flow. I'm going to port my platform onto 
master and do some testing.

FWIW neon seems to think the BQL changes for usbnet might have fixed 
this as a side-effect. Let me test it and see. I'm not sure how that 
will help me on 5.15 in the interim though. I may just carry a 
downstream patch to force kicking the queues.
>
> /P
