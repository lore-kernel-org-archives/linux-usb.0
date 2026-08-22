Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A038538D6A2
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787389977; cv=pass; b=Joil9eqAQXlTawN5bfkiOpcsA68xAaNx44MWjwv6sCTPBssmcJkyLKyQgPr03RHW9dy74uQzrjFHOuY4F9Bgu+TYxJuikgwlSFjbdKWsI8Nz6W6eJgDkVvph4hp0TiGVXMTZ1NvM0dqUlyjU7f4KKBjdViqAV7ODreopwQ2OpLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787389977; c=relaxed/simple;
	bh=2MwHIoHjfQgFOXH1q3c7Fke9NA/pcypshND1SuBjvCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1Cgz3i/ldtW4iXFjh9P6tZvTWDKC0XMSaol6+iYcN1BkMW3HiICnufUaEyG+ZvZl3ynoEOQe/NlsnATxdMSN52GL+FMKKxoD0qsH1PESKjcjh4k0sPY8EQBYcZXs4Gun4P0VojXwuvX1qira7SjI9vIOAXuodL7escuF6akGmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Td5S6gB1; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Td5S6gB1"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d032846c95so22507565ad.1
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 02:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787389976; cv=none;
        d=google.com; s=arc-20260327;
        b=WA/cC/GaqASYdmUOpwDegjDmmbJF5EUjgyampaqGtRvyEbhU66RKjjL9oN+8sfMk6S
         IK5v8Z1BskPGiQiEPwC3vBg0H29DqPgQAjIzc0Q/1iu5MuA5D1wX22rP8W/umnP9mc4R
         9TAk6b14WPOrCLIXJLqhRopuNkrV74G/zFN8BVTVa5qe/DE+OljtHMib+Tsvi6ngAMSb
         vq1+WL88cDF1ASZjT2emnNYIDm7I+9xYHFdcZSXorhnAs33CnwhqSWtTDBfzjHbBnaw+
         j6KFfS+qMQF0FvI/FdyCJq8raHKuKq2KXGDZSOX/ODj7pUez/Q+0ETg/XYzNGeFPmwcU
         CYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2MwHIoHjfQgFOXH1q3c7Fke9NA/pcypshND1SuBjvCA=;
        fh=HjfO0UDUt+YdXByN8hHAj46IgCydTnlIn3TPL1TS1TM=;
        b=WeEzRdqaHB9LWe58Vqk35kjp3DLjRxSjoU3965/blUbMaTHl341pr5uTSl1ygllVgj
         D2Nsiar3kCHAldSDztzCbD+q3so3GBJL4Kv7AEg2eCiIMIKB8wJhM+cX4yiGoL+hd3l1
         oZ3ilJOew+2zVe4vSTtvexOZSaFZmj2OyRHGHcHpZhj5yzRkEFBFeLjDKLrxWB8EwUM5
         kaRVBzYgM10FE6mT+JuVR0/qckSQbeDOyI+RaOG38ab/25RW0gLkWHxPRQk3/cIqtSDw
         fkTLimn+sVxXa2BK4G00WwhBNCj+r9eV1/hVwYyoeecpt+KBQQpI5y2nppaGYcOuur1O
         k8dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787389976; x=1787994776; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MwHIoHjfQgFOXH1q3c7Fke9NA/pcypshND1SuBjvCA=;
        b=Td5S6gB1its1QHuLe38gfny8OwhP1U1Bdx/7Dv9rbzYSDynpQlnVeRyBMLKxHjZJdu
         oUk4BuBTVJqUXWhdDtUnJLm2Sy37Nldn+UFTm6LSGCa8eCrklesC1uh4vycE7WeRKigp
         5QTH5kMvimTYdn1rL+vGYB4dSRkv4E1xbg39SSDLJd0wHHfaxmVpFTuSNwtm/CFHRqcX
         m8EIJagb2/hnp+kFPLLcJSbqwzakLRHKt+g4Mv+5yjx07zfXZUBg95/L16fpPQKUnRpe
         YgV6zJHgmCizclxxQhF/jJw2O+vjqSAGcDS13U4GgtE3xGE870+z4rdVWUy81TXXy8nV
         mkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787389976; x=1787994776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2MwHIoHjfQgFOXH1q3c7Fke9NA/pcypshND1SuBjvCA=;
        b=T9Iu8FxM9Yu4lEDgJPdQpGeTvHNzUig5h543LbELJdO3KXJk3CvsI8E+BcHkPP2NGy
         aLLHnBAqkowOzdCooCDTsNsTIbs+gsTlBDloMglRhDNB/JDSjNxyu4sgG1rguKLwTPNb
         OMOxwoe9DuhuB/6eeVEnPjFOXHzvw3D5FLkX+HuwYBQOAOwGAemZFlOXx3lNET1Wr74K
         1FJSFBAqjAf4wiVuTJJyQGhE3fpyPK3dMQnPqBC3+v19VJ+w0pJna7xP3rDaEgRBZVgG
         UuPTqTXYdi6r+4yXHi9J88AAhzRPt8MNz3Ri2OiD0geA6sVpd7/irQNmmNTx5TboP9oW
         F6IQ==
X-Forwarded-Encrypted: i=1; AHgh+Rof3grvlKAwaQ0A8j+O71DnKq676wc/TAW8TBks3Ybe2lvcabX9iTaNCuO/VUliiXmcHJTMyWAxbfU=@vger.kernel.org
X-Gm-Message-State: AFuF++mY8QGzEBl/SDNmNdBn59pMntlISO5PJl5Iw+aGRHPkEBooa09w
	5uyfCGlm6H6yDD/hp+Dg0AwAYjdgqmw95KUBKFNwWTNLK/4GFIdZsNRPp+hl2n4f20DdBjzJs7/
	h6g0lgDI1XmbUMjAN+arH5e8tVvxo5uk=
X-Gm-Gg: AR+sD11qAq3Hs9+3+hPdmdnRxhyRJ4jTJUA2oYOZz9Yu/tm4otHzT5fEI0GmlB75QE3
	cBZyXfL3O8qnAenCxCZJtLhkJrBEP6J/sxSIMq+kgdTdRPvr8g5u52ztd6b4/aOfuU77RebZtgp
	xIWbYpGO24BsxUvNzTI8K61tOLCGugMt2o/9LTud8ydtd8uByCpN56NhS33IuwtPI6Hxm+uPMBO
	g1bKNaRPTd6wfAnsyW6lGMLKqervcem2C5QWzGpX9R76vycJdDLHspXXTbb701WIVg6td3hLFCz
	yLdgSLxdt76v3xpTERgO2jdQJkyeQ5vuHllR0B2jfxvnFzlh48qM1yKORYQmuPF1DZYdovTSrvT
	TqKpCFLBRAbvFtlSiTmzPyj73CdWqN+pswTwiGAfepnvu0SpVC44+FtYbgffb6YaY/o9h8MgdU8
	hgw+n6FL8sTDriAA==
X-Received: by 2002:a17:903:354b:b0:2d3:2e86:647a with SMTP id
 d9443c01a7336-2d64af6f896mr239987105ad.5.1787389975945; Sat, 22 Aug 2026
 02:12:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812042842.15209-1-phucduc.bui@gmail.com> <20260812042842.15209-2-phucduc.bui@gmail.com>
 <d62e3e3d-9639-4f11-a9f1-460d300c2ac0@oss.qualcomm.com>
In-Reply-To: <d62e3e3d-9639-4f11-a9f1-460d300c2ac0@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 22 Aug 2026 16:12:44 +0700
X-Gm-Features: AcwNN1WymSu3M-4thaXX2g8igzJ8ORKE90IN_Y9QZEBt6T109X5SSm7wsMyE3vI
Message-ID: <CAABR9nHGbJ3iNvMZFG2bKV029OWWLQnJSNt3+Da3EgTraT0WhQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] thermal: hwmon: Remove redundant OOM message
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, rafael@kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rafael and Daniel,

Thanks for your reviews and Acks.

Best regards,
Phuc
