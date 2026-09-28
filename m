Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7893156661
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 01:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558559; cv=none; b=oABUTe6yXtIVuMBQICXF3F3LBjcXgw5SyWkg18G4r4sznZilP+cjdYHM9pbw/DIaQ1/CmTSH74OL+BjLs/J/Pr94ISHAK4YX0sfy5g37EB5pbA7W5bzQlseaXLfYFb7MpC3/8gf3LTQTodSm0fD7enHk4sNO9ohyxH1UuvPJ034=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558559; c=relaxed/simple;
	bh=BW/0BDERUIPHqBA/I9JdvbyIuIdoqPgHN+Tv+n45Y4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVLn3AzYU8Q+7fVwtNPD1X+L9Au13KKtjwVMlvK1NKLYuHYnpTu6GWEX0W/hM+ltvXXBALyipclcnxCe3ovAxz963CL/AI3xFfWC/mv7EA6ktw6uPH/1WJHsBgh14iif3aQy9W83a0ROwxXm0uDsCZeNIAQdfV7GUaOLEQFG59U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=vHAfJbp3; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="vHAfJbp3"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93a2a8c29c4so240144585a.3
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 18:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790558556; x=1791163356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKyRFibV0iFRaRaQLS6eL+/JprGUwZnonQhnzUn1fc0=;
        b=vHAfJbp3GF1TioDkz1+CgZXe2EfgdSTd5ieSw8jauaiigYtAeaLSyIBaF+ZK8cDNWu
         ARy0F4FYQQ8DYsr6IxDrS1tagkXUiYM+DqQt+Fh3x16mTUJAx5xH//f+FByuyYr/9GTH
         9x/p0+QPTrERqHd8p3iw3zyeUXNNNVKPy9OxGSRBavb4IDDl4EAKJyBXVtjNeLHxJ5MD
         yAHJ27/ulygIE/7K/Z+4LtQArMcGdgwL8CHMsYPtn3Ie3qCqbh2t/hpWEVK2aDw2yBYX
         DElkjWZCyURUa9o5YlrityK7urFCtoAiQv+bCiDkiQS6qg/WZo1KkWU/qDD4bZohlS48
         NHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558556; x=1791163356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKyRFibV0iFRaRaQLS6eL+/JprGUwZnonQhnzUn1fc0=;
        b=NSqKqdqgm2v1Q4nduVK9SOKPWl1qbL0CyO4N63+EADZbzKTvunjjm83aj1YvSs93Ui
         s0+6+XQIdaFKSTn+RpOATjLzV5IaFXcmf86hET1plgTC6QOcfrJ21lXhG3eibMoUhuva
         bzS6Mg3w4Pa1GpZkeRPXdIcg/Q6TURDon0fWhvHc2dULfsnjR9zPlbaWb/m6oDc13Qcy
         lBZbljMnqkYQifMIhwMTPtd5crqsY+bW+yqDB5DLdxFI+NdpgRNc4NoELZ1DdStTBmxa
         jDzIkVp8X8zRkYX0hfJutyRMlVK238cB0N00Lr11JdDjU805Qv4hxcHcddwYCZGrxGe0
         BRVQ==
X-Gm-Message-State: AFuF++nm4m2cj1QI+Rv9jMZgFduSPfpgXPMN4c2jWkPJVHyFoIwb/CwS
	iGrdkA+rdc+myYW8KWqAF5fH7ZH7MNmG9FCbPDmivgA+JdDXm/Z9JGfcLeEfzQKYRo6Szk9XeXT
	Gs/WnEw==
X-Gm-Gg: AYBFou3D1LwJITyCvMo1E47knWPU6ipgCuxHp3DoJpFSgdADt4d5ueE+1zI1uHUFgUg
	TTSUGpdd87CLDsQfjcni9HRAZTR5TF6B2fsu+6MkkpjHCv0oVO8o8aDCYvey3lKJ4/oaqUu0J1D
	bhlOt3i51uxbTuYr8ujUfFA+bWQpICkFqOLEY2jfMx305fFZe5ZDFjz4rlA+lU9WUbsAJEJ3biV
	Hr71QD/L0oFYgs/G1rgLcxPeQ08lr2vHW3ZRPoQmGxWXdRsTFK09fMg3MckgFNVWR1cp9HjH5yT
	U3m8G85LbuNhrXPa4RjetgorUKxMe4sT6s+L8UFR9/SSHWd3LQEkT8LFExEyHsfj8re1+mtQ7sb
	UgHhNHUgd836iZZHalykCjy+BhTQMLFCvLvdaHrMdvDqUIEIqsqJT37KkaxfDsFGpQ0wkLW5eIk
	pzNIJ4FCG5FLZmDIRlOWV1mccCmi5foT0qCzooOOU6kE2670ms4uqsILsVg0rquCCfNjqXe70=
X-Received: by 2002:a05:620a:7014:b0:937:6de8:b40 with SMTP id af79cd13be357-93c43bbc447mr1793010285a.15.1790558556280;
        Sun, 27 Sep 2026 18:22:36 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c81596168sm26778085a.44.2026.09.27.18.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:22:35 -0700 (PDT)
Date: Sun, 27 Sep 2026 21:22:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Johann Klammer <klammerj@a1.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: possible regression in usb-storage?
Message-ID: <ed5b68f1-2875-4d2a-97a2-ddb075a562e0@rowland.harvard.edu>
References: <d0cd9a1e-cdb4-97c2-5bcd-1bc9f5d9173c@a1.net>
 <5ab3e86c-f209-ca72-58e7-8ea56225775b@a1.net>
 <f66b21bd-707b-4503-a40d-972832db130f@rowland.harvard.edu>
 <605c0845-cfd4-0702-4322-53d9c8037b70@a1.net>
 <be5899e3-3e3e-4977-e4aa-32ca368f06cd@a1.net>
 <7e2440cb-41aa-3429-fb6f-b0f4cf761029@a1.net>
 <986f81b9-c195-4ef4-8176-ca69a8f506c4@rowland.harvard.edu>
 <04f165bc-e79e-4ef4-1f22-d4ad086c3ffb@a1.net>
 <0a83299e-c9db-46fb-a4ee-85b4e861f5d4@rowland.harvard.edu>
 <bc169809-3fa0-0a8f-911b-909ad2f8d46f@a1.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc169809-3fa0-0a8f-911b-909ad2f8d46f@a1.net>

On Sat, Sep 26, 2026 at 10:44:42PM +0200, Johann Klammer wrote:
> 
> 
> On 9/26/26 4:46 PM, Alan Stern wrote:
> > 
> > Don't know what you mean by that question.  If you're referring to
> > the packet size for endpoint 0 and the device is running at High Speed
> > (USB 2, 480 Mb/s) or below, the answer is No.  SuperSpeed (USB 3, 5000
> > Mb/s or above) has a maximum packet size for endpoint 0 of 512 bytes.
> > But transfers can contain multiple packets.
> > 
> > At this point I don't see any reasonable explanation for the difference
> > in behavior you're observing.  My best recommendation is that you try a
> > bunch of different kernel versions between 4.9 and 6.9 to pin down
> > exactly at what stage things stopped working.  A git bisection could
> > then zero in on the exact commit responsible for the change.
> > 
> > Alan Stern
> > 
> 
> It seems that my power supply is unstable. I had a dvb stick and another
> hdd(selfpowered) plugged in, and with both disconnected the drive comes up
> ok with and without the quirks(except for a cache consistency message when
> unplugging). Plugging in the second hdd with the seagate mounted gives me
> `critical target errors`in dmesg. Plugging in just the dvb stick with
> seagate mounted gives no disk errors but unplugging and replugging the drive
> it won't come up.
> 
> Sorry..

Don't worry about.  A power supply problem could easily explain what 
you've been seeing.

BTW, you can get rid of those cache synchronization errors by unmounting 
the filesystem and doing the equivalent of Windows' "Safely remove 
hardware".  Perhaps your graphical desktop environment already has a way 
to do this, but even if it doesn't, you can do the unmount manually and 
then (as root) just write anything -- even a blank line -- to the 
/sys/bus/usb/devices/.../remove file.

Regardless, simply unplugging a drive while it is mounted isn't a good 
idea; it can lead to data loss.

Alan Stern
