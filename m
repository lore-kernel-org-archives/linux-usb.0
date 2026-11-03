Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687336;
	b=UDbQhwu09dC9U51O0I7BoHjKbjstN+e4np1MJAtYi4xh0lizxzAA/DNzcEGyk1sT6Q0O
	 GDmOG2HgzwAPn5HWO0B41lt5vVQF/Jdx5qxd7KLv2efIXYGnttdQgEuxw/P4GSHq0HQ9B
	 ITrznrduN8BWMzf8r++oH9bFZfXpGmyQxIwnvcbR1g7jcOPcRLZAT8ElJN0tc6kRu90dL
	 IPBi0ckIUGyk1Kz6W3E+Vk0f/aiN+q5LKAhcPGAEUPnK8hCNq6zfNHD/3ODbfO+yMYMrK
	 LyxeSgf5bYBgJRIf22JTQChePkv4GpDRmauPy9BZBYqjovroQKYVqcb7aR0DIVAEbww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IJdPaPjcw6KM6945s4a205xSGvQ0CD8VKU+jx7vOtyA=;
	b=PvXhLdiabFqA3F1VwziHR32r12oJBOoM09KEavGYn8pB6Rfly+PgQ1b47Vcfzpbjv4qZ
	 4HDxT1tb2yiCAt5WaRsVEJQk8F3kTM2wtUFOspmt5QmPJrvziP2EJI4L74z+v3xxAydoY
	 y+6YjxyJpJ0mPsiv2uUzkpQ2T2tNUEJKhWmVsJeECr6cgh1adOVsvJeL/zJu9nH6OmNV/
	 jlIQSmbHzX0hBwk5bufLvULoXxoZBL21s4sIFEo+jIFhMKh+V+J2nHguJ3y+AlY3n4psF
	 yDmFPDRpkBO4TD+YDG3ZNuUFeRDh0Vkx0AxGeKDx9S54zDP225fRRVGj8gdCcMM4z1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggLmM6kc;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40744606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 06:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40744606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggLmM6kc
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1772190f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 22:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793687335; x=1794292135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJdPaPjcw6KM6945s4a205xSGvQ0CD8VKU+jx7vOtyA=;
        b=ggLmM6kctlkClhPvgazfgjnpR41FPu4meieUr8d2i0Zr9wr6S26bdWwNNj56lucKnD
         w0AnKXMM8uYV2WYIZTzfGorw6gsWy3k6opQQ5+5fmf/S48JR4wcX2kUqq8ZFMrKom+65
         KnvZQGaaxSXdsX0eJw/uJ6wezDLb+8xvOt6ErbqaZ7B7RBM4fwxLL8rYV6fCcz+o7FrT
         Yt2xDXBZv+mKlyUdNhBEc29JHaTJDIH6qwWNjxkovYimHIVoMeK1m/1t245C0D4IV3lE
         R5wJx/JoAKL6oTp5TnqurjfCNW+wYJFC1jvx8S88cakSGEfCjnivSYWy791/L5zComo3
         qb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793687335; x=1794292135;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJdPaPjcw6KM6945s4a205xSGvQ0CD8VKU+jx7vOtyA=;
        b=gvdRDKsnNZlEHtEq1syzQZITdwVq6bFqsOG9jNkTfdFm0D1zODSnwiu98Q34nc1Qag
         aYVI0r3e0vK33s/yhxPLkeYjOdAClrMPLKVEO3YTnP5WKSI1iyk5QOaYDihgovKwcpfA
         WnBAfxgNMK1GBNobj5ZuCq8d0rn3yrJpAjZEqguaRvokBDgij0BdMGZLyrONtB1vqdVt
         26QeR8WvkiOLgyhwtm+l85melERV2khY3CR5XUGyWXFnNpUpOivq2q5n3SEz8GOC75uA
         9HmzVHD8PXoStOAk2YpDV/dxTdZs37sk+pkejRJMBIyEQL/0tQaneD5vOsC2/BB5k1Zw
         ZBjw==
X-Forwarded-Encrypted: i=1; AKwUvBxYVrNw7Gkq+sPtWb9OmcXXh5T5CSNXE3BszdNhxlWEj2qiTRDyma024XKUn8EJtFKR0R14VtzI7Nw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tE67CIqwVfOwNECIIKzNvkC3zs0q0pmCPLkeZC5B8YfkiKDg4
	LRHmyMTwTze3PziP+FVr9BCg9BUNChqfZTSJgVxsXjh2x386iZP0HR1z
X-Gm-Gg: AYBFou3gCbJrxBY9GVmqujL88ks0Avo90sO07FLZc5RHzAMSG5IMLsNRkea6NErSx7v
	AeivUf6/uJ2/kd7cTB72vPaGUTFbsJNH53YXxFq7au/IkmJJ6E5DDZQVgPyjacxCBViWe5tKimW
	iWHVsqXDXhpvRwwWmPO4F87NNQIzYNz0ljgzmJRBH40S2NN2pdkV+xhR/CqoHe6mtc4EtUcfdOb
	hmZZ8aFRDX2P360Aj10YprXlO3qsT13CJvZRvfyraQRqg9S8XdUmqigVea9EAthv4QpWtvn99r1
	hsScNE5GluWEQO32PE3f6LqsegRdKEgZ4+XI/8snBKjfx3Un8H25Ff8Vm2wL7TJCymSPG5X324+
	J2W2ubmvDMCqUPEekYJZnq4LkxfR3Hia81jjDyzkghX2r5AFhvr+RLvoy/vO1FtZRfasR/olO+Z
	ylV7zMFnwRJe8TAi8OiDsHdeTgImS118YBDc1fPc0WHiLJPwPJ/niOjkWmmGIbEyMK8uBsj7RFO
	x0ZfhBGD4HE2eFubOCatXb9+X2f2QpVdcfcoRvksJxEk7WkFSkaUfIitSZRVxcPrDcGOAC0V1d/
	P+7epc+9klb+lehNqbhRWokbOZDF5eBd3TBS+jI=
X-Received: by 2002:a05:6000:22c8:b0:48e:f07:160e with SMTP id ffacd0b85a97d-48e6e305c3bmr27453712f8f.38.1793687334595;
        Mon, 02 Nov 2026 22:28:54 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d511sm22743032f8f.8.2026.11.02.22.28.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 02 Nov 2026 22:28:54 -0800 (PST)
Date: Tue, 3 Nov 2026 07:28:49 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Kuangyi Chiang <ki.chiang65@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
Message-ID: <20261103072849.623325cd.michal.pecio@gmail.com>
In-Reply-To: <CAHN5xi3NY2AUQK2=M80RYkx1N-bA8=zPEE6Y5400EYyMv1=aCg@mail.gmail.com>
References: <20260914013033.3938-1-ki.chiang65@gmail.com>
	<20260914130907.749cd8e7.michal.pecio@gmail.com>
	<CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
	<0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com>
	<CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
	<CAHN5xi1M+g3Sy8YkRKpZuU7EtTxiyi0ZD6y5TCcAZTrpxUpHNw@mail.gmail.com>
	<20261029060335.3ed1fbcf.michal.pecio@gmail.com>
	<CAHN5xi3NY2AUQK2=M80RYkx1N-bA8=zPEE6Y5400EYyMv1=aCg@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 09:01:50 +0800, Kuangyi Chiang wrote:
> However, we captured USB traces using a protocol analyzer and
> observed different behavior between the failing and successful
> cases.
> 
> In the failing case, the device ACKed the DATA stage but kept
> NAKing the STATUS stage until the transfer timed out.
> 
> In the successful case, the device initially NAKed the DATA stage,
> then ACKed it, and the STATUS stage completed successfully.
> 
> We haven't determined the root cause yet.
> 
> In our tests, adding a 1 ms delay to both the UAC and UVC
> control request paths prevented the timeouts.

Could it be a device bug triggered by timing? Some xHCI controllers
perform control transfers faster than others - we have seen anything
(IIRC) from complete transfer in a microframe, through one stage per
microframe, up to one stage per frame even for high-speed devices.
We are not aware of any way to influence this, besides delaying URB
submissions. I don't know how fast EHCI controllers are.

> > > So far, we have reproduced the issue with these xHCI hosts:
> > >
> > > ASMedia ASM1142 (1b21:1242)
> > > Etron EJ168 (1b6f:7023)
> > > Etron EJ188 (1b6f:7052)
> > > Intel xHCI (8086:8d31)  
> >
> > I don't know that Intel chip, but the others are quite buggy.
> >
> > Have you tried other HCs? Any successes?
> > IME, chips from NEC, Fresco, Renesas are more reliable.  
> 
> In our recent tests without the delay patches, we did not
> observe any timeouts on the following HCs:
> 
> AMD EHCI (1002:4396)
> AMD xHCI (1022:149c)
> ASMedia ASM1042A (1b21:1142)
> NEC xHCI (1033:0194)

ASM1042A surprises me, because ASMedia in general are among the fastest
ones, except AMD Promontory chipsets which are extremely slow. NEC was
slightly slower than the fastest chips IIRC. I'm not familiar with AMD
Matisse and have no idea what xHCI IP they put inside.

Purely out of curiosity, could you connect a USB 3.0 NIC like RTL8153
or AX88197 to Matisse and see if it breaks after a minute of:

  while :; do ifconfig <xxx> up ; ifconfig <xxx> down ; echo -n . ; done

I found this to be a 100% reliable way to detect ASMedia controllers,
including those in AMD Promontory chipsets. This is the periodic unlink
bug I mentioned, which is mostly mitigated by 7c0c31c66a7f9 in 7.3,
so the test is more effective on 7.2.

Regards,
Michal
