Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123477;
	b=NKiLXvtEWnUC44BflrTnHNQnUXdgnHt2ilRi64Pi7jFifCh3viaejh0kFmf9u0XAE6PY
	 jhyYPlpWUHBEMSypv4oqG5BmTec+6N8UFIt/esgBKRpjmOcRKw95+v1U1b0l8LKCrTUyR
	 IwqPjrRJzuaNhW4mm2CDs5EzpG3qb2LY9WapQRdS/wyInYPajkbmfhOPf5fHRV7S15ivX
	 NgxZ9uhcXWdfXYGSpP6R2FVhWyW5jwDUIdqXM5NICeeXumjVvqc+UOqAs8mqIf/jxkh4H
	 3FIu3zSUupDPE5NJpIJJJyHQEdBeqgeFeoBH3iXoIjpXw3GNKVDMe+JazAMNsqXiFEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LTu8+DHLWdBcMEbo3FpQh945AxcJKdloTy8V0XlCjV0=;
	b=btYH6vNLVKL9+hj9aGOhRzOvmueqkNv0xys0CPNgMbmw3i95Z3z4Emuk67aJOMsGT+Tt
	 T25UqZU5AqKHC94Ukz4rt4/wAT7424nK7+Bcx98rayA1S7NiglaaB1Nsnx/ObqfYWJH+C
	 oGHxe/4yGOi7Vk8kJkpZB/rImJdUUln9JkONIlzLK9AgeMbPewQcVVGiHfXg+fe0DRkio
	 eoJWkmUFegHoZBdWSONLbD/YMd6/RYGfkiAnY3j7nzym3Dzv2J0gHfcDbEDcv0FGfAhR+
	 BMwtHDIz5WI46aZE4QKh2NqOxvTIx8GFHcMr+oDPS2i95wGXBNWV9ZCwQJ2eLiAtRzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alstergee.com;
	spf=pass smtp.mailfrom=alstergee.com;
	dkim=pass header.d=alstergee.com header.i=@alstergee.com header.a=rsa-sha256 header.s=google header.b=wWxcctXR;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A438606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 21:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A438606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alstergee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alstergee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=alstergee.com header.i=@alstergee.com header.a=rsa-sha256 header.s=google header.b=wWxcctXR
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso99028a12.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=alstergee.com; s=google; t=1795123472; x=1795728272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTu8+DHLWdBcMEbo3FpQh945AxcJKdloTy8V0XlCjV0=;
        b=wWxcctXR17zfT5nhX1739LL1IqZhP/hU8hDDI5jox1VMXqJAh4keLJcrIXZkSnUFkI
         jnls41RwiM/xF6FppkPTcoOtIluWS8rgiGhjW9hPIqzBRGeGyN2iQiQUDPSNvSMkLV8R
         o/XdWJY0mSM3qC/Dkp5Z3C4Q6XJYPFqyw5IAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123472; x=1795728272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTu8+DHLWdBcMEbo3FpQh945AxcJKdloTy8V0XlCjV0=;
        b=zDBk3UyKDaqMo5kfkfCfiDA2p/5VI4KJq3hflSpb1ypGaGfgT1u9/6Yts3gjEEDbqk
         JucSEWm24kqaU+Bnh5LZDlYj3ppVTR9lZwJH15dU5fVt9LRlTy724bXK49vPyVEKRU6B
         M6bKOcBp7ew2gT0/gIR2kiG5/x4UOlHIlyDa521zaR9c+mzrLu5yZb8YfV2nq+cK/0t+
         leWcb3gRe05XuSB5bP+2E05K4FIl2jEq5R1MBb9H/BdWf3uCBV2It1pWtOlEP2y1H55h
         ELftlZIN3YH7t9WZkIJTyMygi8mEG7sPDQkq8W332VDTtrwyT5G/H7vG10xyVMVPS1zw
         6EMg==
X-Forwarded-Encrypted: i=1; AL+hErGAsuFrtJyjC414NDCoUqg7oKsZT2c/pUQHmsfbu6MEBwAPZ6VqV/vvKpjQt1sm2o6DdQG7/WBPVxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DrFjNW479S8ocyFNoqhOf7SQj4Axigh246QvHuI653WQ01Opo
	+g9DQoehqBs+lZnrrjmvaWlIPxcnitWq89/gRGnWUuAFzUXon1EDHDMyacN4DQM386tAerNo8mk
	vvRwZ3A==
X-Gm-Gg: AZFdTZcwHtBAcUM62nno8CzzKVJL1lqxOddO4H5o7WR9ej9hOF3IOOoJBmiaeU7sliw
	FnGA4+IN6u/bTaqdGN9Di7pG+DMPcdJm+1Mx+DvsrhEmJvbFBWS9gL4PTtjYaVINPyUmXxUgVdP
	Cu7YgT5mW9tvfBd92VbdoZANGcK3PfmUWiakqEVwuD38awfS5Pq5xouBzeKnZ0LtezM/BuuRhjD
	tchiLOAYzIYBmHjMjsSzKDnOSG/z9/38fkb/lt9/VUkU49CVfz6E/lQks45nfwPckaHsxFr24Iy
	UZzNvVhCKNS40X2dAzm2YeAzgYAFFgSXILOmty68OQpRAkvE4JXjFhPGwMAsqy3cQvSx64jlV1y
	YnYVjYkNPtBdzyeLV/tV3JlOUHF+lhil0yULoTZlaGWTnvfsNLNeXy9Jvv3DrBcLAhvvW92OVb4
	1sD1+9QDVLMhZWTVx+Xyn0hKaaMk43M/kwhmLh0bOoOYjvgiPk6eep+vSjMsDWXDmJ0Sk03d/pb
	nEbfuiRMr+bLJix+6++mxdv0ZgQbzSWn3ngwHovndbm72Nxis0EmwjWs926KJjMzuXr3dxB3Gky
	5QimzdA2zrnjdpUXPbRyCDM2ySyKia4iDCEbwQCz6LX96TEV9gyP0I1VvKMdqaNKu1SCj/AUCxA
	zfzF+onEid/wT
X-Received: by 2002:a17:90a:ec86:b0:3b3:b0f4:1bf5 with SMTP id 98e67ed59e1d1-3b41c9cf154mr503200a91.25.1795123471595;
        Thu, 19 Nov 2026 13:24:31 -0800 (PST)
Received: from [10.144.72.140] ([172.56.203.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm3815659a91.7.2026.11.19.13.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:24:30 -0800 (PST)
Message-ID: <5ee36c74-54a2-4fc1-b4bd-61a1d8342c2e@alstergee.com>
Date: Thu, 19 Nov 2026 14:24:25 -0700
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
To: huangwei@kylinos.cn
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260902090531.2134150-1-huangwei@kylinos.cn>
 <20260902090531.2134150-1-huangwei@kylinos.cn>
Subject: Re: [PATCH v3] usb: typec: ucsi: do not register UCSI on Lenovo
 Legion Pro 7 16IAX10H
Content-Language: en-US
From: Alex <alex@alstergee.com>
In-Reply-To: <20260902090531.2134150-1-huangwei@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei, Heikki, Greg,

I need to correct my earlier report and withdraw my Tested-by on this
patch. Please don't apply v3 as it stands.

The commit message says that with ucsi_acpi blacklisted the EC
negotiates PD on its own and charging works normally. Longer testing
shows that isn't true. With ucsi_acpi and typec_ucsi blacklisted and
confirmed not loaded, USB-C charging still drops:

- 2026-11-18: ADP0 went offline about 7.5 minutes after a cold boot,
with no suspend and no replug.
- 2026-11-19: ADP0 went offline at about 588 s uptime and came back
by itself about 5 minutes later.

When it drops, the EC itself stops seeing the adapter. ADPT (bit 7
of EC register 0xA3, which ADP0._PSR reads) clears. Unplugging and
replugging, or swapping to a different charger, often doesn't bring
it back. Swapping from my main charger (a Shargeek, 100 W or more)
to a 60 W PD charger while it was dropped changed nothing in the EC.
Sometimes it recovers by itself, and a power cycle always does. The
barrel jack is unaffected.

My August test only showed that charging stayed up across a module
reload for a few minutes. That was too short to show the blacklist
fixes anything, and I shouldn't have offered a Tested-by on that
basis. I'm sorry for the noise.

What I believe now:

- The drops happen with and without ucsi_acpi bound, so the
driver is not the cause. Skipping UCSI on this machine wouldn't
fix the problem, and it would hide the typec/PD information.
With ucsi_acpi bound on Q7CN78WW it probes cleanly, and both
ports and pd0/pd1 (PD rev 3.0) appear. Drops happen in both
configurations. I don't have enough data yet to say whether
binding UCSI changes how often they happen.
- Windows on the same machine, using the stock Microsoft UCSI
driver (UcmUcsiAcpiClient, no Lenovo filter driver), charges
reliably over USB-C. So whatever goes wrong probably depends on
something Linux does, or doesn't do, with the EC or ACPI
firmware. I don't know what that is yet.
- The PPM reports UCSI version 0x0120. While charging is broken,
CCI = 0x08000000 and CONTROL = 0, so the PPM looks idle, not
stuck.
- At the moment of the 11-19 drop, with UCSI not loaded, dmesg
shows a burst of "workqueue: acpi_os_execute_deferred hogged CPU
for >10000us" warnings. Those come from ACPI/EC event handling,
not from UCSI. I mention them only because they line up with the
drop.
- The one remaining UCSI-side issue I can see is cosmetic:
ucsi-source-psy reports voltage_now = 0 while charging. That is
unrelated to the drops.

System details:

Machine: Lenovo Legion Pro 7 16IAX10H, DMI product 83F5
CPU: Intel Core Ultra 9 275HX (Arrow Lake-HX)
BIOS: Q7CN78WW (2026-04-07), EC firmware revision 1.78.
Seen earlier on Q7CN44WW too. Lenovo's newer Q7CN83WW
only changes the lid logo LED, according to its readme.
Distro: Ubuntu 26.04.1 LTS
Kernel: 7.0.0-43-generic (Ubuntu 7.0.0-43.43, newest in the
archive); also seen on 7.0.0-42 and a 6.18 build. Not tested on
mainline yet.
Cmdline: quiet splash snd_intel_dspcfg.dsp_driver=3
mem_sleep_default=s2idle
Taint: 4160 (O + U). Out-of-tree modules: nvidia-open
595.99.02 and acpi_call 1.2.2 (DKMS), the latter used
for the EC/PPM reads above.
Firmware: linux-firmware 20260319.git217ca6e4
Userspace power: power-profiles-daemon 0.30, thermald 2.5.11,
upower 1.91.1, tlp 1.8.0 (installed, not running).
ideapad conservation_mode = 0.
Other platform drivers loaded: ideapad_laptop, lenovo_wmi_*
(gamezone, other, events, capdata), int3400_thermal,
processor_thermal_*, nvidia_wmi_ec_backlight.
I haven't yet ruled these out by blacklisting them.

I'll keep working on it and will follow up on bugzilla #221142 with
data rather than conclusions. I can test on a current mainline
kernel, and capture anything else that would help (traces, ACPI/EC
dumps, specific test sequences).

Thanks for your time on this, and again, sorry for steering you
wrong.

Alex
