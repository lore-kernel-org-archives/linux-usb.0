Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413484;
	b=lPnLQL2HS4Rc2rl/rW2AtNwe+Rs6KzSSTjkLFM8ub547SpJXHfMDu8SMk3oMgSuDQPOB
	 p/NMX81sFfMeuDzCToAOQ3cUuklJD3h69FjPm5hfU3P22VDYA6JUUeaJzf2NY14CW/ZCW
	 PfIIdu/jUSNFUse3Bwln+F4/1MBmA042b/vRa0xsnUfQChdjWor4t7NSST1r8VoF5Gkyw
	 Ai1Pb5Wh461ZIOCzgjuZU/2AUcKVG4HR1GFLXDO/Vx6zJA8SHKDQVui/ADvz8F+8R+NAi
	 gzvINO29rHUYL4BvJqy3go9l4cpYu1FaqC/7FVvLSYRt0v/A6pFCxtJJ5FuAIzeghpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sQWFC0f/1QUqQOyIEaOvFD2iCSmZJvZkkc8zqipcZqI=;
	b=YWies2pEwSXL6Vx1ZG5MNhw9Gr4VED4oF9BtHgOtj42f4ePcHLAmHwYgkHmwsT/vmZbW
	 HJEqEx2EfW/wn5ImWulAkg33Qkdio7rF7D8FYVPCbn3fu1rTU6CFsa92b6qSwlwRRUT6p
	 9m76n+DEm7ihq4klVhW22WkkO2s5+0kaoJTMt189fOaS2EyVnNbkfg4/R9O7k7/57otKK
	 3E/OAbGJ0ddBjooj9AfYPA36pcIivCZzo4+fJfQds95mfLPbomtOWMWrnazZLV74yjHBi
	 26xlHqS1MOJTYvL2PhyLPf88G7Ser9BSrtyMGHJ54tr3Zt5Io+geiU6OIpBFmdrF+tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHkvfDT4;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6D9606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 05:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC6D9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHkvfDT4
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38587f3de36so3535171eec.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 21:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413482; x=1796018282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQWFC0f/1QUqQOyIEaOvFD2iCSmZJvZkkc8zqipcZqI=;
        b=VHkvfDT4ZdDkVgEY5yPw1fzWVMiIToihl58fOKC0/u6RHqbbBneDNjOyLIuCq+VXXb
         FgbPArrbmCP+tvvSfNlbgaeTtNhh1OOcQ1hwHbD7sWAkmoJKe/Rx6sQ97+sHZWqm5dwa
         ZwPh93nJp/zmgCypr9/ltLq+JmsDXmT8C9YF3o3nbNB1deFUfsIndbUN45aviERka1mc
         K0BMlttarmtX+9lwTnJsuiBrohnRWp5qI/GxerP+2kg3SYSpfp3kMTZUmKRV8H+lgEqi
         GooVAr2wPlHab+41Taf+XpDJhc2EdnS8vArCSlVtobVcoYQqPke4y8hG8RpctK/K3qqP
         HA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413482; x=1796018282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQWFC0f/1QUqQOyIEaOvFD2iCSmZJvZkkc8zqipcZqI=;
        b=zR8/OmD9j9mAEy5XC4AFZhJHcqwQp+J1YypPMB17+IxpcXjB/vjvCEVG70rnaliWh0
         OYAAD2dgMvLhspm36KxvD66rv0dxUMtJZ8ms6Y1vgbynLuuOb6HsYCVIXIeGX0s5B7Mr
         omIFtuGgF4EZzwE/y/+AVBaDp1pJmngLgtUzwR8J9orCi1oFL36Q1NHfohW7Z+kCtKTe
         4JfoiDfrYFXe4aMFa28KR2c4f5kSlO9kVvq77fIfo3+xZckcL1ORff7juwjW+q6t1yfb
         BMQcQxztmK7Mpcsid0THXSOzaIe/sgGBc4stO22/WHCKuSEGJewlCdcMHRE5mpCU+LRU
         nh9w==
X-Forwarded-Encrypted: i=1; AL+hErHYjfjBmr8okRsMVHWwbdet39odqZ9nP841FKyTjrBgXWaRA4cKa8WEawScX1gCCU/+Z4G1YPZ5uh4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O4ecktPctjWUXfPPgDc6ykxV4lYN+nPIM4+dMOhyBri/31hnM
	DlMmn9f7syK13GERffBcgwsCmgg7FpHPdk6bSi5zL65TUP73XpS3Te0=
X-Gm-Gg: AZFdTZeUMFfM9BmFmpBaoYcSfHc9LQEpRhPYu3eUiydXZeo9Mjsfd5c3ZDVE4VMj8qZ
	TZsbpiXY9Oc0aeGOz2Fufv0kbuWLK77uE9W8kQTPFSo/eEUTD8mU/aL2Tys7/vcdDiNDafjbaJf
	Q+dBy7RscorKsXiXImZrXlk+W7i8eS0VjRJJSVCCBXVi1ouazpQAp3+e0hwyiHy/t981MLhfBmu
	5fBISULArmI7rfIfgEbOVbJzsRjDo9wf/+i08k8vc+z95P0m78DHXTxkFcy/krvvksxRwZbmlY1
	rtpKXk/MqNGZpWsbFUJxCy9cjAYixx+/Izxt978kSTKcCRST/t/pevH2Mlf00e2+Sr0F/JBwrxT
	9Zl8WRmgI4lg7RO487YeD0Vl8iTUt/7yUnBxeJTUNWI9ykLMPs+Ql8mnkvaKac9V/DSW8GeHwk+
	fYbFVpNhN8J6ZQAXPlUelQ5FlGa4sg6QTh3nZAesvo/aasmNHaVukHXwlHwemOHaHjvvydUylwX
	MpmtmfTmXwmqHMAW7TWeBnU+7PIeLbSLAZ+c3aKwclGE6Tb4Q8FXeskVa3eGL7O+AegiU/vAg/F
	w6DYxj0QaY8bvOwSDAcqnT4LDxuV+0xDbE2jn+a5lDLOoue+BCBcEKOxbMLEjuyld+FNO77ht6R
	CwOEsq82P
X-Received: by 2002:a05:7300:c7ca:b0:386:964d:45d2 with SMTP id 5a478bee46e88-386964d5ddcmr8948434eec.11.1795413482428;
        Sun, 22 Nov 2026 21:58:02 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm29938655eec.16.2026.11.22.21.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:58:01 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: atharvatiwarilinuxdev@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: acpi: Get correct location data for Apple macs
Date: Mon, 23 Nov 2026 00:57:57 -0500
Message-ID: <20261123055757.11283-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026112338-pummel-hyperlink-2957@gregkh>
References: <2026112338-pummel-hyperlink-2957@gregkh>
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

> Local static variables are usually not a good idea.  Why is this needed
> as it's only referenced once?

is_apple_location signifies that SSD methods are available in the ACPI bus,
if we dont check this there might be a situation like:

Is internal USB Controller = true
x86_apple_machine = true
is_apple_machine (Are there any SSD methods in the hub) = false

So all USB2.0 ports will get a error, and all USB3.0 ports will succeed and
provide wrong info.

And btw the SSD methods are only used in new intel macs (2016+), so this becomes necessary.

Thanks,

Atharva.
