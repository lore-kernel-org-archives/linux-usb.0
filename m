Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EBB411F82
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318193; cv=none; b=gIQuob83rf3EYNZVP1aqNcAa/j6YfZdFWqczxzUYqMJFQoxsHdwenR75Jnm6TEKZHpjeSXOF299CE8T3DSIh8Tg+KWEN2eMSuiY2knrSXfR68E9MEIP65A77XPuOGGJCgx7WjAjEkvPkVFqwU76XvU+FBZNXh+b8VQbRJ9Ci24U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318193; c=relaxed/simple;
	bh=hkcrbB9ShktWX1H9AZ/hhXP4eZ26Ve/kCzpgfCdUT2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oum4GlI2UDG3DvbGqsgRUlUR3Nel+Oz9QTzylj0i8URxMYJGsDtTZ5gb7DDp7CkwQ+vau/k1xn7X1Ydv9eChTef4tdY8GJwRCYfUxCxBRg6RSYmVy78zhJgDp9LFk/iZt8Qe4LPI6bMTJ3eNRVw4VygkdjlS4ukzK9iRQM6HTtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtUO37h4; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtUO37h4"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca7c1176317so618351a12.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785318192; x=1785922992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t83ZAl+HTEOhK7yZi3aE9T2wGWPdb8+DClmlDdgQvpA=;
        b=JtUO37h4LqYcWNJl8gtSWbDpQOCbH27M9saeYKYhx2HxuUhIGjMTDgjIfQxIkJtpiT
         TQor7HFnFcBbXCgiiHx0M1sy4ilrfHkRzNtZf6EG73NE4/JBr1dh5iM5UpUK5ZX2hpsQ
         YS79mcBmlpwJg1aqS34RLdrlzo9QfA2NJdgpjonhFKESChtdRib2gAtQQOund8w683qn
         xgXbPcz4ot4pz3Ksy/YO4UOTuOK44e7YoTFoeIxzzascRl4avZJkx1hOVK/ZoDc4F8kt
         RyC6z/Bcoh/RPFo3A1UlfPmwsmmOXSuSV9XF8YlAKIusNvnJ/j3pBs9ufQaCn+SWAvkH
         pXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785318192; x=1785922992;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t83ZAl+HTEOhK7yZi3aE9T2wGWPdb8+DClmlDdgQvpA=;
        b=DO2h+P8vBlNNJAhmPsoC/d7SC/3XSY7bqgp9vDlCNEdbtkW4sctgYC/EkZjpI8tzM5
         OuxEiVQ6U68169HMRjuSfJNjhEEJriWiK8h9u6GRX2sKsa710P319MV98UM1BL4d6l0b
         J71h6t3idiOo2PykQa2XJaXBuEhwpV10NKE9CMEKZNehYLuGvsASTczizck4Q63OVP6d
         xuxzShQJ8ZB52MN3qUD21suZO3icpU86YS1w+hdyKvs+vvojF8Ss9NyBfLpGSOtmKJZH
         I3yxFVXYqHHls4ntYqm8wGxvwkXeYnwkCNb8fvPVk5GH5povJSEA9plndoC+mbGQqQ6I
         SghA==
X-Forwarded-Encrypted: i=1; AHgh+Rrx1BsPBfoGiGjGMNDGpmp6c4ENwh8ouMFjAWSy/xdpXwHVGhu0KdbzPm4QYOcBnY+A8fCZ4qqo/Ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBhmPNh23pDMGwdzwD65ve/QbMl1z6fxH/krCpoLJDrgr1Va/m
	D/RJ1TasG0X3GMrp+8I4DzxtbIa5Jzg4XBuRo6fFeI4GJeulnSe4JGAO5lMHSrm63EY=
X-Gm-Gg: AR+sD11eGvpBZ2pyajctK6XO5G2/fEdH8AlEUcG2BvzYiG0ykUE3CY+ZunrfznlVdaW
	ecvYRYeV8UPPZ3Wxu8BPNZNAJumyyxe05dtk06jTgzdZj4NmX1NBfWvJ4CmbBPGKLvu7FQ0vt9x
	dL//F1asfBC4vZCjPN5khzg7/O0rKgFJ8J0hx/jtF0nb97dgtQTUJMTqBFhp79apn64LWvDD3R8
	iEdLeLPb1zLqPf1WBeTDSyZ8ktxugaZd1pQBBpEOLKkyGN7cecKE4+nWEMf7WuNhSIuFjXs7HEw
	DO3liNJvkajWVGC1BoUYrLXUAbhaD/d4poW566nt3+l3TRYT5wY5IWWojk5Dlhhl4eKmJWPQ8PZ
	lnF2kCD9k0XnfzKdV8UDmbKI/MeAjWNn9inR06iNOZEuj/82qp/XsZBhadhgc1KQnP7LLG76Vq0
	LVudSYGaD0cZCHHTrgkfLDEVVTH60iOKNZej26HGomUoE1vJVswN0rVc+CP6ffLpv5AEQjywsHC
	gdrRmLIWFMgllrnDmDTps1K62864Wl2yEfSoDg=
X-Received: by 2002:a05:6a21:2291:b0:3c3:83e6:c705 with SMTP id adf61e73a8af0-3c8ba5beec0mr7303606637.35.1785318191749;
        Wed, 29 Jul 2026 02:43:11 -0700 (PDT)
Received: from localhost ([2409:40c4:138:9281:7d6f:2f3:b5b5:ed1c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d37368sm14174469eec.22.2026.07.29.02.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:43:11 -0700 (PDT)
Date: Wed, 29 Jul 2026 15:13:07 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Snake Pilot <snakepilot10@gmail.com>
Cc: linux-wireless@vger.kernel.org, pkshih@realtek.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] rtw88_8723de: Wi-Fi and Bluetooth fail after warm reboot
Message-ID: <amnGXPlG6nKUdEl7@eggarch>
References: <CA+fxq6gPCQOYr6mh+_1ReOGzaiTULzMazXhs5q0PXc8PsjRJEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+fxq6gPCQOYr6mh+_1ReOGzaiTULzMazXhs5q0PXc8PsjRJEQ@mail.gmail.com>

Hi,

Could you provide the following:
1) Full dmesg after warm and cold boot
2) 'journalctl -k -b -1' after warm boot

Also please run a few tests,
1) Unload rtw88_8723de only or btusb only and perform warm reboot
and see if both of them are broken while unloading only one driver
2) Repeat the above with a delay like sleep 0, 1, 3, 5
3) Try 'echo 1 | sudo tee /sys/bus/pci/devices/0000:02:00.0/reset' 
after warm reboot see if it pci function reset recovers wifi

Also provide output of 'lspci -vv -s 02:00.0' and 'lsusb -t'
after warm reboot.

That would be helpful.

Thanks, 
Lovekesh
