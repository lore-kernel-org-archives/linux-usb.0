Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7BA2D592C
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 03:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790218965; cv=pass; b=lgKRNWc6NP8S2/FByc2jSX42VgK2GfFuBIx2yrAItyNtO081TpbrRnLdUIz9c5qkENIIG2FrACtv+DpC2xGByhccZBFOD7gU6AWo1CTp8ThTyLw9GrVa0qw1wS8XcUMgFALatgSfJlLmcQ+B8yfjbE8A7yh64gNlpvrx9D8ba1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790218965; c=relaxed/simple;
	bh=My8gP2x9VXOZt/1THw2jYUKtfH8yuoeGmrJirB/XdhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlBERbqQiE8tkKMUN9w1QPBLRbxInLCEmXpw60EUt244e+ep6tUnfHNl7VJ7QiThaDumvZ0tbqthfXG5mVmvoq1dAHWnZDMh759dwxRo4Cn1HcKIfi8adh7p0SSzdqzL2wUqg78pXPbZsROFHZVaH5k6c4pquaSjLOxQFPAhsV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJvE2klh; arc=pass smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJvE2klh"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-80032c08611so1227009a34.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 20:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790218962; cv=none;
        d=google.com; s=arc-20260327;
        b=qcagOp/Evk8TdWpiGdY6QP1lWWVGUQoYB9B/pvrBaam1ilD4f/Tl2ZRGMYv3IT147r
         sTA0RGd2jh8SJvnWqLJ6hKqJzJAvwHzP7MTe82xdfTGgkXH2DgJmtjCIKFWVFzgZmYNO
         L0LEXtc2KL6ieXdC2hHALNL5DDzTDb2rmG5qnfgQA3UeoONhDy3xJzXpOBG6iME8HFju
         asRt3Y/wRbeL7XSrHODYo9qGyFIJ9N1sO1qsY7CXXrz3OH+7f0sWXjUUE5U43VyKTpXd
         trC6UoTaf4kbhDNmLb+Zpxd7J8eQPyKcxHNiFzwfo1DBQqxY6WlWu85c7I5QjG+jSaYX
         wzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EwXsFDFiXIFTgFA/L6vXECIjLCpAg71NcgLuFokl5Xw=;
        fh=xG127O46TjLsdrUugGQBRfxpj6JJlbdxAwYue3OTAiA=;
        b=sk50l2RNTV4vhKZcEAD0seH86qJUdp61JEcRuWcg36o7Uz15KCXkQyhAXN97RYHKW3
         82/k7iaZ1V3jxbGSKhEBGErT5uNUXDnSHY4EDVRjF3PgzH7fmcrbRZZ6jwtIpO0zUKkx
         wCehgRpHS6x/BCtBd0up2xAmqhEuygE6ZXMEIcaBVUemRYk7m7+oBZiESfj5cVa+IhQS
         SW2ly0SGvmjpldzf3vivmY8tnnMn5X9lTankBfEmPX5X8WOge0ePI7co/fhJ/TyV/MN2
         elu3JacBgAPjB1/fWMdVj7wrRi9MrHCnaBY8qdYwNQBNVr6SJc6DbYHg85lUsyjOdndq
         mNnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790218962; x=1790823762; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwXsFDFiXIFTgFA/L6vXECIjLCpAg71NcgLuFokl5Xw=;
        b=LJvE2klh1fHvRNCh5Ir+LAPC+XC/hf4RzwKhwBNgX2ny9nUfdKwQSB1mRcB41xuFpA
         7KxA0AXlfDdJGi3U2PeUnZt90oFeZYE+wKkXIBL+AKB6BHPwy5gP/svxdk1Q1pvqNLLc
         xccksXQLZHFEvXLJsmSEE9OEDXr6OMCMG00uLwH3MDrUXszNP+N4sYRjZVKqhQUFusOJ
         Z3Zz5yD7sJayOsAgGCQIPYiWmogFUhbloHc2n5eEPTVxJNiRdXyAPURKbGnJPidZ22Q9
         5pRW93iAWZYeROOsKqlzs4Qe/0QpbKDd720cP0+Z+oglXqyiveMtla+aYGPwPXCQx6u8
         1yKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790218962; x=1790823762;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EwXsFDFiXIFTgFA/L6vXECIjLCpAg71NcgLuFokl5Xw=;
        b=V+AARKcIpKjVcAxPQAvDKsmxtW2oth+0vug/qZfuYiJZFBqCnXnLIq7C72CXGqoLjf
         bO14qqldTQ3Ap7NBf5siG6DcT4Q/HgDLUDVFZF/1PdV7taTuBnFDx2qamc0Dz4oJnnnM
         kGa3lDtz08zrnuOXYOxCAQHHPhwrLjRt/LlKxLZDG1+sueO8aOLmcawyRZGb9zcUAO7m
         uJd+hZE10SSBlz2RBfJSiLrJ3sCF+1H6KC+d7XnY+jf/F0lRU9ZxPFo6+mEd+gKcdw5/
         SWJdmECEBBmvlMx/aCFMusTU8/VcquBMU+gJJ0AoSyQO5BRH5MZ+ZJol1SXXK1uIVZr7
         7Guw==
X-Gm-Message-State: AFuF++mlNsttykE64R2HhN5DzG2VC62+VP54PAokJTnKwNxZhSv76lsD
	FTSDy8zFL5Syi45xMYPl3wG/fBgNbJJpiDt4UTxuLEb7k0n76cpzfSxK5RcbWDyxmfD4HobTLE3
	5czpg+yasqyBHeQzxaxzuTZSuMKqwV0Q=
X-Gm-Gg: AYBFou1GIxTmlzYA2ky+P7MwJV+5kTesLDTi7BXv2FvHMsVOFgcQR8503CkWWgVIOgL
	JYi9ggLtLBurk4QtHyIIVyG+YQdbb2gr5uVsBZTK7nXvyOYX3masZZfN8fVyhAwhR7GNt2598qI
	vOiAH0QKdqZ682C6OCFDTQTZbtoSilv7UaGlto2NtuqSW0k6GS8FCTX8qZog8DxrXSBM2Lv2Mzs
	XzvUyr+rgwqpKturMTMvjA1P4ctMCUQPyXE5GTVsouB9U1HcKh6X80jh9BT134InBDta+17oAL/
	DeuKO+CjOJ3FLR6jQvotKVdkgEl5pxpEmFvfWujoRZSJyrHhjM8Pm4h8b4ZRIvVEPXo31xnbYK/
	U8WdrCt/a8VI=
X-Received: by 2002:a05:6820:217:b0:6c9:80d8:a1fb with SMTP id
 006d021491bc7-6d4410d606bmr1324024eaf.56.1790218962052; Wed, 23 Sep 2026
 20:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915043845.GG106095@black.igk.intel.com> <CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
 <20260915050515.GI106095@black.igk.intel.com> <CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
 <20260916075135.GN106095@black.igk.intel.com> <CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
 <20260917043847.GV106095@black.igk.intel.com> <CANcA1gDFygEN68vnoocpLg10jMQctb3aG_QU55nZK3GuxSrD6w@mail.gmail.com>
 <20260921044453.GJ106095@black.igk.intel.com> <CANcA1gA_o_34UUZMzFp+cMuMFvk9S4uizYCdR8iG55pKaw+71A@mail.gmail.com>
 <20260922042608.GZ106095@black.igk.intel.com>
In-Reply-To: <20260922042608.GZ106095@black.igk.intel.com>
From: Ben <benstaples10@gmail.com>
Date: Wed, 23 Sep 2026 23:02:29 -0400
X-Gm-Features: AclHuK8qbDveBlcYIRFslMmhxH4-TIYlbvaqfJaJIXvHWWASiCC_HfIkXLWDsG4
Message-ID: <CANcA1gAijg6Ftmw9+aeuG+SjKKwKo-HyXb+kfBiGFGj=ZzNvaQ@mail.gmail.com>
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org, 
	YehezkelShB@gmail.com, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: multipart/mixed; boundary="0000000000004dc3d7065c31d545"

--0000000000004dc3d7065c31d545
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

> It could be that it went into runtime suspend before that. One thing you
> could try is to connect USB3 device to the dock, like memory stick or so.
> That would prevent xHCI from entering runtime suspend.

I have had a usb drive plugged into the dock just for quickly checking
whether the usb ports on the dock are working properly each boot via
lsusb. I believe that was the case during the boot that I shared.

> Can you see the 0c:00.0 xHCI in the device manager? I would expect yes an=
d
> then this ends up just being Linux specific issue with the xHCI on GR. I'=
m
> adding Mathias in case he has any ideas.

I was truly having a hard time figuring out how to get this
information on Windows and it really was not cooperating when I booted
it up.
If it's still useful, the next time around (or within the next couple
days when I can find some time) I can confirm this with certainty.

> Can you take snapshot copy of some xHC rings and registers a couple secon=
ds before
> the crash? following directories would be interesting, (including all fil=
es,
> especially the 'trbs' ones):

I've attached logs that should contain the relevant information around
the time of this event:
    command-ring  msi-irqs.txt    pci-irq.txt      proc-interrupts.txt
 reg-op       uptime.txt
    event-ring    pci-enable.txt  power-state.txt  reg-cap
 reg-runtime

>[   24.975645] xhci_hcd 0000:0c:00.0: Abort failed to stop command ring: -=
110

I am providing these and I will hold onto additional ones from 2.48
seconds into the boot.
    24.57 /run/xhci-initrd/slot_200
    24.68 /run/xhci-initrd/slot_201
    24.79 /run/xhci-initrd/slot_202
    24.90 /run/xhci-initrd/slot_203
    25.01 /run/xhci-initrd/slot_204
    25.12 /run/xhci-initrd/slot_205

Best,
Ben
On Tue, Sep 22, 2026 at 12:26=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, Sep 21, 2026 at 07:25:53PM -0400, Ben wrote:
> > Mika,
> >
> > I've attached the dmesg output from cold boot, the output of tbdump,
> > and a copy of my boot record for a sanity check. I plugged my
> > mouse/keyboard driectly into the motherboard as I tried once before
> > this and did not have access to USB devices through the dock.
>
> Thanks! Yeah I can see that the xHCI is enumerated just fine:
>
> [    0.444810] xhci_hcd 0000:0c:00.0: xHCI Host Controller
> [    0.444815] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bu=
s number 1
> [    0.446007] xhci_hcd 0000:0c:00.0: hcc params 0x20007fc1 hci version 0=
x110 quirks 0x0000000000009810
> [    0.446448] xhci_hcd 0000:0c:00.0: xHCI Host Controller
> [    0.446450] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bu=
s number 2
> [    0.446452] xhci_hcd 0000:0c:00.0: Host supports USB 3.1 Enhanced Supe=
rSpeed
>
> but then later on it is not accessible anymore:
>
> [   24.964042] xhci_hcd 0000:0c:00.0: Abort failed to stop command ring: =
-110
> [   24.964050] xhci_hcd 0000:0c:00.0: xHCI host controller not responding=
, assume dead
> [   24.964053] xhci_hcd 0000:0c:00.0: HC died; cleaning up
> [   24.964071] xhci_hcd 0000:0c:00.0: Error while assigning device slot I=
D: Command Aborted
> [   24.964075] xhci_hcd 0000:0c:00.0: Max number of devices this xHCI hos=
t supports is 64.
>
> It could be that it went into runtime suspend before that. One thing you
> could try is to connect USB3 device to the dock, like memory stick or so.
> That would prevent xHCI from entering runtime suspend.
>
> > > Are you able to see if the link is USB4 or TB3? Can you do the same n=
ow
> > > with Linux, boot with the dock connected and share full dmesg?
> >
> > In Windows, I check with the Intel Thunderbolt Control Center, which
> > indicated the link was TB4. I then checked the Device manager and the
> > PCIE device indicated that it was taking up enough of the bus to
> > support that, though I was not able to take a screenshot. I could
> > check again if it would be helpful
>
> Can you see the 0c:00.0 xHCI in the device manager? I would expect yes an=
d
> then this ends up just being Linux specific issue with the xHCI on GR. I'=
m
> adding Mathias in case he has any ideas.

--0000000000004dc3d7065c31d545
Content-Type: application/gzip; name="xhci_bootlogs.tar.gz"
Content-Disposition: attachment; filename="xhci_bootlogs.tar.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_muey4h9s0>
X-Attachment-Id: f_muey4h9s0

H4sIAAAAAAAAA+2db1PbSNq985pPoXf7ZknU3fpL1f6qiCEZ1wJhIbOztVtPpWRZDq6AzRgzmfn2
PwmwZXNs7Mk54+CgfnYqeoS47Jt2X24E3Of1m98v8v6nm0F2fXMxHL959RcMvxxxGFb/mjj0Z/+d
jFcmtGFoystMed64ILKvvPCveDKPx+3NOBt53qur4bD83/LrVn18S8frR/N/czkcf7K+r3whzMz/
3Vw/+ndu/oMgLuc/MC7e8PyPhsPxU9et+viWjqXzX/xWDMa7o/7gM/1S+PPzH1kTNvO/ibHO/BeD
X2+L2+KbH6Oa4CgIls+/dY/mP4780v++sM6l44XPv//7wxwY30ZdVx7sfO+n1IwNjnXWf7fY+PoP
Y79Z/5sYzfp/2WOd9Z//kV9+++pfY/2Xb/aP1r+1cbP+NzFMs9xf9Fhn/Y9HnRvmMZ5c/8Ya/P4v
Nn7QrP9NDM/3cAuw543/uC68v/188s+TD7+c/M3b/X/eKPvqTXT9xMHOAqBRA60a6NTAQA0M1cBI
DYzVwEQNTNXATA3sqIG5GthVAws1sCcGGrUPjdqHRu1Do/ahUfvQqH1o1D40ah8atQ+N2odG7UOj
9qFR+9CofWjUPjRqH1q1D63ah1btQ6v2oVX70Kp9aNU+tGofWrUPrdqHVu1Dq/ahVfvQqn1o1T60
ah86tQ+d2odO7UOn9qFT+9CpfejUPnRqHzq1D53ah07tQ6f2oVP70Kl96NQ+dGofBmofBmofBmof
BmofBmofBmofBmofBmofBmofBmofBmofBmofBmofBmofBmofBmofhmofhmofhmofhmofhmofhmof
hmofhmofhmofhmofhmofhmofhmofhmofhmofhmofRmofRmofRmofRmofRmofRmofRmofRmofRmof
RmofRmofRmofRmofRmofRmofRmofxmofxmofxmofxmofxmofxmofxmofxmofxmofxmofxmofxmof
xmofxmofxmofxmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmof
JmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofZmofZmof
ZmofZmofZmofZmofZmofZmofZmofZmofZmofZmofZmofZmofZmofZmofdtQ+7Kh92FH7sKP2YUft
w47ahx21DztqH3bUPuyofdhR+7Cj9mFH7cOO2ocdtQ87ah/mah/mah/mah/mah/mah/mah/mah/m
ah/mah/mah/mah/mah/mah/mah/mah/mah921T7sqn3YVfuwq/ZhV+3DrtqHXbUPu2ofdtU+7Kp9
2FX7sKv2YVftw67ah121D7tqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZq
HxZqHxZqHxZqH/bUPuypfdhT+7Cn9mFP7cOe2oc9tQ97ah/21D7sqX3YU/uwp/ZhT+3DntqHPbUP
e6QPzSNg4JM+RCDpQwSSPkQg6UMEkj5EIOlDBJI+RCDpQwSSPkQg6UMEkj5EIOlDBJI+RCDpQwSS
PkSg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqH
bP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2odW7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfApDtf4hA
tQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6H
CFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dt
f4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP
2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU
+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7MFH7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ
7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwBk+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2
/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+
ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ
7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8h
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
/nDglevocq6ej0dv69+bn/naTbFeUP82va1nyvj1VAb1VzSod+szcz376pl5iPqsiVcchvVh9Wjl
s/ZuLobDcXf4dVBVcXa8hSL4eFGUGrj0it+KwXh+Vn4628p6RkU5K5dd7+4XqWcLOni3jQUdFL2y
gqLrHY5GwxFWddw63MKqjrP8oj8ovFJw+Rev+D0vris33NVzOlPP4jeN53c4X8/18PKy2hq0T7Zw
ak6HN+OiW/+xnTcYjvu9fp7dyfvOE+WW9HQbdz0nRVVaOT2PKnwo6rT9yxYWBfP1NftS3F4/FPXv
7d2feu9vy/nyjotuP6umrayk+QPbH3ss//vfvL/bH/2qaAD29N//3v0N8OP+H9aFr5q//93ACJJm
hb/ksXz9D78Wo91ycYzpJoB/fv3HJnDN+t/EOGg6a73o8eT7fzGobiXTW4DV698+fv+Poqb/50ZG
0zrrZY+l6//q5m7/TzX+eRjfsP8Pmv3/Zkaz/3/ZY8n6N2+Ej1Gt8DgMn1j/M/3/wqhc/4EJ/Fde
KHwOS8cLX/9L5//uZuZu9TNq+qXw5+c/siZq5n8TY535Lwa/3ha3394GeOX7v3WP5j+O/Ob7/42M
+aiNuxac3/spNWODY5313y02vv7Dpv/vZkaz/l/2WGf953/kl0wIwOrv/+3j9W9d0/9/I6O5//ey
xzrrfzzq3DCP8eT6N9bg93+x8Zv7fxsZ3uO0vWoLII3vc744LNT54rBQ54vDQp0vDgt1vjgs1Pni
sFDni8NCnS8OC3W+OCzU+eKwUOeLw0KdLw4Ldb44LNT54rBQ54vDk51R+9CofWjUPjRqHxq1D43a
h0btQ6P2oVH70Kh9aNQ+NGofGrUPjdqHRu1Do/ahVfvQqn1o1T60ah9atQ+t2odW7UOr9qFV+9Cq
fWjVPrRqH1q1D63ah1btQ6v2oVP70Kl96NQ+dGofOrUPndqHTu1Dp/ahU/vQqX3o1D50ah86tQ+d
2odO7UOn9mGg9mGg9mGg9mGg9mGg9mGg9mGg9mGg9mGg9mGg9mGg9mGg9mGg9mGg9mGg9mGg9mGo
9mGo9mGo9mGo9mGo9mGo9mGo9mGo9mGo9mGo9mGo9mGo9mGo9mGo9mGo9mGo9mGk9mGk9mGk9mGk
9mGk9mGk9mGk9mGk9mGk9mGk9mGk9mGk9mGk9mGk9mGk9mGk9mGs9mGs9mGs9mGs9mGs9mGs9mGs
9mGs9mGs9mGs9mGs9mGs9mGs9mGs9mGs9mGs9mGi9mGi9mGi9mGi9mGi9mGi9mGi9mGi9mGi9mGi
9mGi9mGi9mGi9mGi9mGi9mGi9mGq9mGq9mGq9mGq9mGq9mGq9mGq9mGq9mGq9mGq9mGq9mGq9mGq
9mGq9mGq9mGq9mGm9mGm9mGm9mGm9mGm9mGm9mGm9mGm9mGm9mGm9mGm9mGm9mGm9mGm9mGm9mGm
9mFH7cOO2ocdtQ87ah921D7sqH3YUfuwo/ZhR+3DjtqHHbUPO2ofdtQ+7Kh92FH7sKP2Ya72Ya72
Ya72Ya72Ya72Ya72Ya72Ya72Ya72Ya72Ya72Ya72Ya72Ya72Ya72Ya72YVftw67ah121D7tqH3bV
PuyqfdhV+7Cr9mFX7cOu2oddtQ+7ah921T7sqn3YVfuwq/ZhofZhofZhofZhofZhofZhofZhofZh
ofZhofZhofZhofZhofZhofZhofZhofZhofZhT+3DntqHPbUPe2of9tQ+7Kl92FP7sKf2YU/tw57a
hz21D3tqH/bUPuypfdhT+7BH+tA8AgY+6UMEkj5EIOlDBJI+RCDpQwSSPkQg6UMEkj5EIOlDBJI+
RCDpQwSSPkQg6UMEkj5EIOlDBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9D
BKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9aNU+ZPsfIlDtQ7b/IQLV
PmT7HyJQ7UO2/yEA2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7
kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hA
tQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6H
CFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dt
f4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ8TtQ/Z/ocIVPuQ7X+I
QLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X8IQLb/IQLVPmT7HyJQ7UO2/yEC
1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsf
IlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2
/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+
ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ
7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8h
AtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7
HyKQ8+HrN79f5P1PN4Ps+uZiOH5zczkcf7K+eZMPr66yQXd31B98fvOKGtUDxWH46uExH/97d2xC
G4bGj4MweuWbKDTulRdyD7veuL0ZZyPPezUaDsdPXbfq41s61pv/YvDrbXFbfONjVBMcBcHy+bdu
fv7Lxy8/7PnSSpeMFz7/8zYx5T873/spNWODY7313y02vP79KGrW/ybG4/XvN+v/RY311n/+R375
rat/jfXv20f7v7j8/5r1v4lhmuX+osd663886tx8+2M8vf5D3wWPv/+LA2Ob9b+JAYEK1RZgzzsc
ZJ3LwjsvXw1e6/6VsOf1LrPPN14LQxiqbxuouxoIFEe+GDbiAIHiyBfDRhwgUBz5YtiIAwSKI18M
G3GAQHHki2EjDhAojnwxbMQBAsWRL4aNOAAgG3GAQLUP2YgDBKp9yEYcIFDtQzbiAIFqH7IRBwhU
+5CNOECg2odsxAEC1T5kIw4QqPYhG3GAQLUP2YgDBKp9yEYcIFDtQzbiAIFqH1q1D9mIAwSqfchG
HCBQ7UM24gCBah+yEQcAZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThA
oNqHbMQBAtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQB
AtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQBAtU+ZCMO
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
2odO7UOn9qFT+9CpfejUPnRqHwZqHwZqHwZqHwZqHwZqHwZqHwZqHwZqHwZqHwZqHwZqHwZqHwZq
HwZqHwZqHwZqH4ZqH4ZqH4ZqH4ZqH4ZqH4ZqH4ZqH4ZqH4ZqH4ZqH4ZqH4ZqH4ZqH4ZqH4ZqH4Zq
H0ZqH0ZqH0ZqH0ZqH0ZqH0ZqH0ZqH0ZqH0ZqH0ZqH0ZqH0ZqH0ZqH0ZqH0ZqH0ZqH8ZqH8ZqH8Zq
H8ZqH8ZqH8ZqH8ZqH8ZqH8ZqH8ZqH8ZqH8ZqH8ZqH8ZqH8ZqH8ZqHyZqHyZqHyZqHyZqHyZqHyZq
HyZqHyZqHyZqHyZqHyZqHyZqHyZqHyZqHyZqHyZqH6ZqH6ZqH6ZqH6ZqH6ZqH6ZqH6ZqH6ZqH6Zq
H6ZqH6ZqH6ZqH6ZqH6ZqH6ZqH6ZqH2ZqH2ZqH2ZqH2ZqH2ZqH2ZqH2ZqH2ZqH2ZqH2ZqH2ZqH2Zq
H2ZqH2ZqH2ZqH2ZqH3bUPuyofdhR+7Cj9mFH7cOO2ocdtQ87ah921D7sqH3YUfuwo/ZhR+3DjtqH
HbUPO2of5mof5mof5mof5mof5mof5mof5mof5mof5mof5mof5mof5mof5mof5mof5mof5mofdtU+
7Kp92FX7sKv2YVftw67ah121D7tqH3bVPuyqfdhV+7Cr9mFX7cOu2oddtQ+7ah8Wah8Wah8Wah8W
ah8Wah8Wah8Wah8Wah8Wah8Wah8Wah8Wah8Wah8Wah8Wah8Wah/21D7sqX3YU/uwp/ZhT+3DntqH
PbUPe2of9tQ+7Kl92FP7sKf2YU/tw57ahz21D3ukD80jYOCTPkQg6UMEkj5EIOlDBJI+RCDpQwSS
PkQg6UMEkj5EIOlDBJI+RCDpQwSSPkQg6UMEkj5EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg
2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHVu1D
tv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HwKQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z
/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7
kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hA
tQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6H
CFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+zBR
+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocAZPsfIlDt
Q7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC
1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsf
IlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2
/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+
ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ
7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8h
AtU+ZPsfIlDtQ7b/IQI5H75+8/tF3v90M8iuby6G4zc3l8PxJ+vbN/nw6iobdHdH/cHnN6+oUT1Q
HIavHh7z8b93xya0YWj8OIjK60wUmuCVF3IPu964vRlnI897NRoOx09dt+rjWzrWm/9i8OttcVt8
42NUExwFwfL5t25+/m352javPF9a6ZLxwud/3ibll93f+d5PqRkbHOut/26x4fXvR3Gz/jcxHq9/
v1n/L2qst/7zP/LLb139a6x/3z7a/8WhjZr1v4lhmuX+osd663886tx8+2M8vf5D3wWPv/+LA+Oa
9b+JAYEK1RZgzzscZJ3LwjsvXw1e6/6VsOf1LrPPN14LQxiqbxuouxoIFEe+GDbiAIHiyBfDRhwg
UBz5YtiIAwSKI18MG3GAQHHki2EjDhAojnwxbMQBAsWRL4aNOAAgG3GAQLUP2YgDBKp9yEYcIFDt
QzbiAIFqH7IRBwhU+5CNOECg2odsxAEC1T5kIw4QqPYhG3GAQLUP2YgDBKp9yEYcIFDtQzbiAIFq
H1q1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcAZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCB
ah+yEQcIVPuQjThAoNqHbMQBAtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcI
VPuQjThAoNqHbMQBAtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThA
oNqHbMQBAtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQB
AtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQBAtU+TNQ+
ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQBANmIAwSqfchG
HCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQBAtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM2
4gCBah+yEQcIVPuQjThAoNqHbMQBAtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+y
EQcIVPuQjThAoNqHbMQBAtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQ
jThAoNqHbMQBAtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqH
bMQBAtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQBAtU+
ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQBAtU+ZCMOEKj2
IRtxgMDKh0ftk396c6erz+oPxqPyE+4f7ag/+PK3hy6F/b187+Ne3nQ3XTGW9v+8vR73r4rX49/5
rpfVlD3d/zd6nP9g/ab//0aGDV7HabNKXuxYuv5Hxefd4bXkMVatfxuaR+u//H+a/r8bGT+fv20d
H3j/qN9zw53y3PnH85lzxt853X9/eN7+7+HslWbn4KT18exo9pzdaZ21zmbPJDsHrbf7+6efjj78
cn++fPO+e6d/OP9T+/1P89jWh5N37fcz54ImleAvGk+u/9HtoNoEsI+xav07P378/u+sbdb/Jsbx
u/bJweF/pmvNpS7ZaZ/5n9rH+yfzC/v+7IdZWWT+3dnDs9IX/8Wrq/Nv9+cWflgt/JmP4eK//+DB
vC9c/WkHi4zxvb+MWzueXP95JtkArF7/j/v/hy5u3v83Mlr7p0eHJ+8/PqynqhW2n/g7P7XOT/fP
9o/Pzf35oDodzJy3d+erPlvljiGoz7uHJXuvh/J8a5ZTnY57eblx+PDh7O3h0dGHd+9q9VRr/Ozn
k4/t48PZ89Un1SA7s/DjbrPwybF0/V+PhvlufzAuRqPb6/ENcyPg6fXvAj8wmP8VNOt/E8ObGa3T
n/360NSHtj509WFQH4b1YVQfxvVhUh+mMw/h14emPrT1oasPg/rw4eF2yv/8vcmzN3ZCrk4/58P2
h93903bLg2F3i+7n4v642niPqgrjvblP3orDpRXGu73sZlwM++XxdX+Qj0eXn7KrblVn8iPVmczM
5Gic+1WB6eICzcKzz+RwaYHpzERm+XW/LND4P9AMGn9mBvePD9rVXZC96scTnv3WV+r3nOnTVnv3
+Ly9W73j7lX/M6/vn85sneVFhXd6fPj3+6PO12p9VhUveek+6+IXVHz/xrJOxU77Wt5M8VCxfXKO
r/N+cXENlZstXMVQefInXt3O/hgV3++V1qo42GzFkpf/fMW2LPr1/QVQcV1nuPUzG61VZ/Qj1Jms
rnMb98JQZ7q6zm3cC0Od2co6g23cMUKdndV1bv97alLtn7DO+z1EVeL2v4mWJbonS3RbX2Jn1Sxu
eGPw15Ronyxx+/cEnVUv1O3fDpQlBqu1Sm8HTBqvfe1fUWdULN7eZRd5/3+zV/xfVe727wryxeXe
/QjiIq9uAwaCWw3ft0iXriwy3MC+J7brX/tnivzPwyu3O61yWZGbncnArX/t2kX2qiLvwEuKjLZ4
Tc4VeffTlSVFxs/h/SQI178Wi4z9VS/X5PnuC9zSH2zNF+kHC4sc/HZV+L9Wd66TxRNpn0GN607k
TI0GajRVjVt8jwBrtFCjrWrcfuvM1OigRlfVuMUbAawxgBqDssZ0i+9/YI0h1BhWNT6zex82WuPa
pTVGUGNU1Si4+fG9fj6GNcZQY1zV+HzvftilW7+lNSZQY1LVuMW3P7DGFGpMqxqf7z5n9nB+lS6r
0eA+x1QbnfQ57FhVE2kWbHSqnU66bTsdGzxRJO50TLXVSVdtdVwcPH3Bc5pJ3OqYaq+T/kh7HYN7
HVNudoxfb3ZclCyjPrPDpUXiZseEVZHPbLfDFYm7HRNVRW7/z3rckvuuV93P17c73slxewtLPBkO
dq+ymy9Z57Lw6l/d3vGOPrQeyrGBjSY3BsM0dJOzUfxwe8W6KIomh0H0sCsN/GDyada3/sNNc2uS
CaG82EzuUhgzvVdj4uBhpZfLP5xcUD7w5O3d+tHkOVg3+QVe66dh+cBHwzy7vP892LlqTrdyck6L
UW84usoGeeFdDQf98XDUH3yeK6z9y2xhize1i79NmLnWLrx25jBYeHYxbPGnzd+Ja5/9y/s6HH2Z
K+Xs8HxaShDUtp+8oMoXSb1rT5PpYRJOH8ea6eME4ZQQRPXNsPpar77WC6dP2tYXmLDeUMbTC8L6
zpqrnsNZcZNfFN3by8cz09o/mpQTpMnkyYRRNPmyuSCZ/CTJBv7kAayZLgobhJOnaNNpOSZNpksl
SadPJpl+k1ovivLayW/DV4eTBy4XYzA9DPzpBa4kvLsd5OP+cOCV6+hyrp6PR2/r35uf+dpNsV5Q
/zZ9uczrj9dTGdQvmaD+4s7M9eyrZ+Yh6rMmXnEY1ofVo5XP2ru5GA7H3eHXQVXF2fEWiuDjRVFq
4NIrfisG4/lZ+elsK+sZFeWsXHa9u1+kni3o4N02FnRQ9MoKiq53OBoNR1jVcetwC6s6zvKL/qDw
SsHlX7zi97y4rtxwV8/pTD2L3zSe3+F8PdfDy8tqa9A+2cKpOR3ejItu/cd23mA47vf6eXYn7ztP
lFvS023c9ZwUVWnl9Dyq8KGo0/YvW1gUzNfX7Etxe/1Q1L+3d3/qvb8t58s7Lrr9rJq2spLmD2x/
7LH873/z/m5/9KuiAdjTf/979zfA0P/Lxa+av//dwAiSZoW/5LF8/Q+/FqPdcnGM6SaAf379xyYI
m/W/iXHQdNZ60ePJ9/9iUN1KprcAq9e/ffz+H8WmWf+bGE3rrJc9lq7/q5u7/T/V+OdhfMP+P2j2
/5sZzf7/ZY8l69+9ET5GtcLjMHxi/c/0/yvf+H0TmGr9h8LnsHS88PW/dP7vbmbuVj+jpl8Kf37+
I2vCZv43MdaZ/2Lw621x++1tgFe+/1v3aP7jyG/6/25kzEdt3LXg/N5PqRkbHOus/26x8fUfxn6z
/jcxmvX/ssc66z//I79kQgBWf/9vH69/a5vv/zcymvt/L3uss/7Ho84N8xhPrn9jDX7/Fxu/6f+9
keE9TturtgDS+D7ni8NCnS8OC3W+OCzU+eKwUOeLw0KdLw4Ldb44LNT54rBQ54vDQp0vDgt1vjgs
1PnisFDni8NCnS8OC3W+ODzZGbUPjdqHRu1Do/ahUfvQqH1o1D40ah8atQ+N2odG7UOj9qFR+9Co
fWjUPjRqH1q1D63ah1btQ6v2oVX70Kp9aNU+tGofWrUPrdqHVu1Dq/ahVfvQqn1o1T60ah86tQ+d
2odO7UOn9qFT+9CpfejUPnRqHzq1D53ah07tQ6f2oVP70Kl96NQ+dGofBmofBmofBmofBmofBmof
BmofBmofBmofBmofBmofBmofBmofBmofBmofBmofBmofhmofhmofhmofhmofhmofhmofhmofhmof
hmofhmofhmofhmofhmofhmofhmofhmofRmofRmofRmofRmofRmofRmofRmofRmofRmofRmofRmof
RmofRmofRmofRmofRmofxmofxmofxmofxmofxmofxmofxmofxmofxmofxmofxmofxmofxmofxmof
xmofxmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofJmofpmof
pmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofpmofZmofZmofZmofZmof
ZmofZmofZmofZmofZmofZmofZmofZmofZmofZmofZmofZmofdtQ+7Kh92FH7sKP2YUftw47ahx21
DztqH3bUPuyofdhR+7Cj9mFH7cOO2ocdtQ87ah/mah/mah/mah/mah/mah/mah/mah/mah/mah/m
ah/mah/mah/mah/mah/mah/mah921T7sqn3YVfuwq/ZhV+3DrtqHXbUPu2ofdtU+7Kp92FX7sKv2
YVftw67ah121D7tqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZqHxZq
HxZqH/bUPuypfdhT+7Cn9mFP7cOe2oc9tQ97ah/21D7sqX3YU/uwp/ZhT+3DntqHPbUPe6QPzSNg
4JM+RCDpQwSSPkQg6UMEkj5EIOlDBJI+RCDpQwSSPkQg6UMEkj5EIOlDBJI+RCDpQwSSPkSg2ods
/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9
yPY/RKDah2z/QwSqfcj2P0Sg2odW7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfApDtf4hAtQ/Z/ocI
VPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/
iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z
/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7
kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hA
tQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7MFH7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP
2f6HCFT7kO1/iEC1D9n+hwBk+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k
+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDt
Q7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC
1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsf
IlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2
/yEC1T5k+x8iUO1Dtv8hAtU+ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAtU+
ZPsfIlDtQ7b/IQLVPmT7HyJQ7UO2/yEC1T5k+x8iUO1Dtv8hAjkfvn7z+0Xe/3QzyK5vLobjNzeX
w/En67s3+fDqKht0d0f9wec3r6hRPVAchq8eHvPxv3fHJrRhaPw4iM0r30Shsa+8kHvY9cbtzTgb
ed6r0XA4fuq6VR/f0rHe/BeDX2+L2+IbH6Oa4CgIls+/dfPzb8vXS/zK86WVLhkvfP7nbWLKf3a+
91NqxgbHeuu/W2x6/Udhs/43MR6vf79Z/y9qrLf+8z/yy29d/Wusf98+2v/FoQ2a9b+JYZrl/qLH
eut/POrcfPtjPL3+Q98Fj7//iwNjmvW/iQGBCtUWYM87HGSdy8I7L18NXuv+lbDn9S6zzzdeC0MY
qm8bqLsaCBRHvhg24gCB4sgXw0YcIFAc+WLYiAMEiiNfDBtxgEBx5IthIw4QKI58MWzEAQLFkS+G
jTgAIBtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQBAtU+ZCMOEKj2IRtx
gEC1D9mIAwSqfchGHCBQ7UM24gCBah9atQ/ZiAMEqn3IRhwgUO1DNuIAgWofshEHAGQjDhCo9iEb
cYBAtQ/ZiAMEqn3IRhwgUO1DNuIAgWofshEHCFT7kI04QKDah2zEAQLVPmQjDhCo9iEbcYBAtQ/Z
iAMEqn3IRhwgUO1DNuIAgWofshEHCFT7kI04QKDah2zEAQLVPmQjDhCo9iEbcYBAtQ/ZiAMEqn3I
RhwgUO1DNuIAgWofshEHCFT7kI04QKDah2zEAQLVPmQjDhCo9iEbcYBAtQ/ZiAMEqn3IRhwgUO1D
NuIAgWofshEHCFT7kI04QKDah2zEAQLVPmQjDhCo9iEbcYBAtQ/ZiAMEqn3IRhwgUO1DNuIAgWof
shEHCFT7kI04QKDah2zEAQLVPkzUPmQjDhCo9iEbcYBAtQ/ZiAMEqn3IRhwgUO1DNuIAgWofshEH
CFT7kI04QKDah2zEAQDZiAMEqn3IRhwgUO1DNuIAgWofshEHCFT7kI04QKDah2zEAQLVPmQjDhCo
9iEbcYBAtQ/ZiAMEqn3IRhwgUO1DNuIAgWofshEHCFT7kI04QKDah2zEAQLVPmQjDhCo9iEbcYBA
tQ/ZiAMEqn3IRhwgUO1DNuIAgWofshEHCFT7kI04QKDah2zEAQLVPmQjDhCo9iEbcYBAtQ/ZiAME
qn3IRhwgUO1DNuIAgWofshEHCFT7kI04QKDah2zEAQLVPmQjDhCo9iEbcYBAtQ/ZiAMEqn3IRhwg
UO1DNuIAgWofshEHCFT7kI04QKDah2zEAQLVPmQjDhCo9iEbcYBAtQ/ZiAMEqn3IRhwgUO1DNuIA
gWofshEHCFT7kI04QKDah2zEAQLVPmQjDhCo9iEbcYBAtQ/ZiAMEqn3IRhwgUO1DNuIAgWofshEH
CFT7kI04QKDah2zEAQLVPmQjDhCo9iEbcYDAyodH7ZN/enOnq8/qD8aj8hPuH+2oP/jyt4cuhf29
fO/jXt50N10xlvb/vL0e96+K1+Pf+a6X1ZQ93f83epz/YJr+/5sZNnidNi2/X+5Yuv5Hxefd4bXk
MVatfxuaR+s/rE41638D4+fzt63jA+8f9XtuuFOeO/94PnPO+Dun++8Pz9v/PZy90uwcnLQ+nh3N
nrM7rbPW2eyZZOeg9XZ///TT0Ydf7s+Xb9537/QP539qv/9pHtv6cPKu/X7mXNAo6i8aT67/0e2g
2gSwj7Fq/Ts/fvz+76zfrP9NjON37ZODw/9M15rLs2ynfeZ/ah/vn8wv7PuzH2Zlkfl3Zw/PSl/8
F6+uzr/dn1v4YbXwZz6Gi//+gwfzvnD1px0sMsb3/jJu7Xhy/eeZZAOwev0/7v8furh5/9/IaO2f
Hh2evP/4sJ6qVth+4u/81Do/3T/bPz439+eD6nQwc97ena/6bJU7hqA+7x6W7L0eyvOtWU51Ou7l
5cbhw4ezt4dHRx/evavVU63xs59PPraPD2fPV59Ug+zMwo+7zcInx9L1fz0a5rv9wbgYjW6vxzfM
jYCn178L/MBg/pdt1v8mhjczWqc/+/WhqQ9tfejqw6A+DOvDqD6M68OkPkxnHsKvD019aOtDVx8G
9eHDw+2U//l7k2dv7IRcnX7Oh+0Pu/un7ZYHw+4W3c/F/XG18R5VFcZ7c5+8FYdLK4x3e9nNuBj2
y+Pr/iAfjy4/ZVfdqs7kR6ozmZnJ0Tj3qwLTxQWahWefyeHSAtOZiczy635ZoPF/oBk0/swM7h8f
tKu7IHvVjyc8+62v1O8506et9u7xeXu3esfdq/5nXt8/ndk6y4sK7/T48O/3R52v1fqsKl7y0n3W
xS+o+P6NZZ2Knfa1vJnioWL75Bxf5/3i4hoqN1u4iqHy5E+8up39MSq+3yutVXGw2YolL//5im1Z
9Ov7C6Dius5w62c2WqvO6EeoM1ld5zbuhaHOdHWd27gXhjqzlXUG27hjhDo7q+vc/vfUpNo/YZ33
e4iqxO1/Ey1LdE+W6La+xM6qWdzwxuCvKdE+WeL27wk6q16o278dKEsMVmuV3g6YNF772r+izqhY
vL3LLvL+/2av+L+q3O3fFeSLy737EcRFXt0GDAS3Gr5vkS5dWWS4gX1PbNe/9s8U+Z+HV253WuWy
Ijc7k4Fb/9q1i+xVRd6BlxQZbfGanCvy7qcrS4qMn8P7SRCufy0WGfurXq7J890XuKU/2Jov0g8W
Fjn47arwf63uXCeLJ9I+gxrXnciZGg3UaKoat/geAdZooUZb1bj91pmp0UGNrqpxizcCWGMANQZl
jekW3//AGkOoMaxqfGb3Pmy0xrVLa4ygxqiqUXDz43v9fAxrjKHGuKrx+d79sEu3fktrTKDGpKpx
i29/YI0p1JhWNT7ffc7s4fwqXVajwX2OqTY66XPYsaom0izY6FQ7nXTbdjo2eKJI3OmYaquTrtrq
uDh4+oLnNJO41THVXif9kfY6Bvc6ptzsGL/e7LgoWUZ9ZodLi8TNjgmrIp/ZbocrEnc7JqqK3P6f
9bgl912vup+vb3e8k+P2FpZ4MhzsXmU3X7LOZeHVv7q94x19aD2UYwOXTHwZpqGbnE38B5R1cRxN
DsP4YVca+FEyucB35mH1WpNGk62XdWZyl8KY6b0aEwcP15YrI5pcEPnR5O3d+hOCLZ9aOuH6UfnA
R8M8u7z/Pdi5ak63cnJOi1FvOLrKBnnhXQ0H/fFw1B98nius/ctsYYs3tYu/TZi51i68duYwWHh2
MWzxp83fiWuf/cv7Ohx9mSvl7PB8WkoQ1LaPJkRj6m/E0mRKTMLptdZMzwbTT/OCuH6mYf2c6mu9
cHqtDeP64/WGMp5eENZ31lz1HM6Km/yi6N5ePp6Z1v7RpJzQ9yeoMEomX20XJJPHsoE/eQBrpovC
BuHkKdp0WqSpSzdJOn0yyfRrY930t9pNOvlt+Opw8lWw/nT/Y/3An17gSsK720E+7g8HXrmOLufq
+Xj0tv69+Zmv3RTrBfVv01uT1B+vpzKoJyKov7gzcz376pl5iPqsiVcc1vN392jls/ZuLobDcXf4
dVBVcXa8hSL4eFGUGrj0it+KwXh+Vn4628p6RkU5K5dd7+4XqWcLOni3jQUdFL2ygqLrHY5GwxFW
ddw63MKqjrP8oj8ovFJw+Rev+D0vris33NVzOlPP4jeN53c4X8/18PKy2hq0T7Zwak6HN+OiW/+x
nTcYjvu9fp7dyfvOE+WW9HQbdz0nRVVaOT2PKnwo6rT9yxYWBfP1NftS3F4/FPXv7d2feu9vy/ny
jotuP6umrayk+QPbH3ss//vfvL/bH/2qaAD29N//3v0N8OP+H+X3nq+av//dwAiSZoW/5LF8/Q+/
FqPdcnGM6SaAf379xyZwzfrfxDhoOmu96PHk+38xqG4l01uA1evfPn7/j6Km/+dGRtM662WPpev/
6uZu/081/nkY37D/D5r9/2ZGs/9/2WPJ+g/eCB+jWuFxGD6x/mf7/5XXmcCUuvBC4XNYOl74+l86
/3c3M3ern1HTL4U/P/+RtbaZ/02Mdea/GPx6W9x+exvgle//1j2a/zjym/3/RsZ81MZdC87v/ZSa
scGxzvrvFhtf/2Hc7P83Mpr1/7LHOus//yO/ZEIAVn//bx+vf+uCZv1vYjT3/172WGf9j0edG+Yx
nlz/xhr8/i82xjTrfxPDe5y2V20BpPF9zheHhTpfHBbqfHFYqPPFYaHOF4eFOl8cFup8cVio88Vh
oc4Xh4U6XxwW6nxxWKjzxWGhzheHhTpfHBbqfHF4sjNqHxq1D43ah0btQ6P2oVH70Kh9aNQ+NGof
GrUPjdqHRu1Do/ahUfvQqH1o1D60ah9atQ+t2odW7UOr9qFV+9CqfWjVPrRqH1q1D63ah1btQ6v2
oVX70Kp9aNU+dGofOrUPndqHTu1Dp/ahU/vQqX3o1D50ah86tQ+d2odO7UOn9qFT+9CpfejUPgzU
PgzUPgzUPgzUPgzUPgzUPgzUPgzUPgzUPgzUPgzUPgzUPgzUPgzUPgzUPgzUPgzVPgzVPgzVPgzV
PgzVPgzVPgzVPgzVPgzVPgzVPgzVPgzVPgzVPgzVPgzVPgzVPozUPozUPozUPozUPozUPozUPozU
PozUPozUPozUPozUPozUPozUPozUPozUPozUPozVPozVPozVPozVPozVPozVPozVPozVPozVPozV
PozVPozVPozVPozVPozVPozVPkzUPkzUPkzUPkzUPkzUPkzUPkzUPkzUPkzUPkzUPkzUPkzUPkzU
PkzUPkzUPkzUPkzVPkzVPkzVPkzVPkzVPkzVPkzVPkzVPkzVPkzVPkzVPkzVPkzVPkzVPkzVPkzV
PszUPszUPszUPszUPszUPszUPszUPszUPszUPszUPszUPszUPszUPszUPszUPszUPuyofdhR+7Cj
9mFH7cOO2ocdtQ87ah921D7sqH3YUfuwo/ZhR+3DjtqHHbUPO2ofdtQ+zNU+zNU+zNU+zNU+zNU+
zNU+zNU+zNU+zNU+zNU+zNU+zNU+zNU+zNU+zNU+zNU+7Kp92FX7sKv2YVftw67ah121D7tqH3bV
PuyqfdhV+7Cr9mFX7cOu2oddtQ+7ah921T4s1D4s1D4s1D4s1D4s1D4s1D4s1D4s1D4s1D4s1D4s
1D4s1D4s1D4s1D4s1D4s1D7sqX3YU/uwp/ZhT+3DntqHPbUPe2of9tQ+7Kl92FP7sKf2YU/tw57a
hz21D3tqH/ZIH5pHwMAnfYhA0ocIJH2IQNKHCCR9iEDShwgkfYhA0ocIJH2IQNKHCCR9iEDShwgk
fYhA0ocIJH2IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7
kO1/iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUPrdqHbP9DBKp9yPY/RKDah2z/QwSqfcj2
PwQg2/8QgWofsv0PEaj2Idv/EIFqH7L9DxGo9iHb/xCBah+y/Q8RqPYh2/8QgWofsv0PEaj2Idv/
EIFqH7L9DxGo9iHb/xCBah+y/Q8RqPYh2/8QgWofsv0PEaj2Idv/EIFqH7L9DxGo9iHb/xCBah+y
/Q8RqPYh2/8QgWofsv0PEaj2Idv/EIFqH7L9DxGo9iHb/xCBah+y/Q8RqPYh2/8QgWofsv0PEaj2
Idv/EIFqH7L9DxGo9iHb/xCBah+y/Q8RqPYh2/8QgWofsv0PEaj2Idv/EIFqH7L9DxGo9iHb/xCB
ah+y/Q8RqPYh2/8QgWofsv0PEaj2Idv/EIFqH7L9DxGo9mGi9iHb/xCBah+y/Q8RqPYh2/8QgWof
sv0PEaj2Idv/EIFqH7L9DxGo9iHb/xCBah+y/Q8ByPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I
9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDa
h2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0ME
qn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/
RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods
/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9
yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwRyPnz95veL
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
8rLaGrRPtnBqToc346Jb/7GdNxiO+71+nt3J+84T5Zb0dBt3PSdFVVo5PY8qfCjqtP3LFhYF8/U1
+1LcXj8U9e/t3Z9672/L+fKOi24/q6atrKT5A9sfeyz/+9+8v9sf/apoAPb03//e/Q0w9P8K7Kvm
7383MIKkWeEveSxf/8OvxWi3XBxjugngn1//sQn9Zv1vYhw0nbVe9Hjy/b8YVLeS6S3A6vVvH7//
R3HT/3Mjo2md9bLH0vV/dXO3/6ca/zyMb9j/B83+fzOj2f+/7LFk/YdvhI9RrfA4DJ9Y/3X/v/K/
cv0HxrlXXih8DkvHC1//S+f/7mbmbvUzavql8OfnP7LGNPO/ibHO/BeDX2+L229vA7zy/d+6R/Mf
h03/z82M+aiNuxac3/spNWODY5313y02v/6j5vv/jYxm/b/ssc76z//IL5kQgNXf/9vH69+WSmjW
/wZGc//vZY911v941LlhHuPJ9W+swe//4vJcs/43MbzHaXvVFkAa3+d8cVio88Vhoc4Xh4U6XxwW
6nxxWKjzxWGhzheHhTpfHBbqfHFYqPPFYaHOF4eFOl8cFup8cVio88Vhoc4Xhyc7o/ahUfvQqH1o
1D40ah8atQ+N2odG7UOj9qFR+9CofWjUPjRqHxq1D43ah0btQ6v2oVX70Kp9aNU+tGofWrUPrdqH
Vu1Dq/ahVfvQqn1o1T60ah9atQ+t2odW7UOn9qFT+9CpfejUPnRqHzq1D53ah07tQ6f2oVP70Kl9
6NQ+dGofOrUPndqHTu3DQO3DQO3DQO3DQO3DQO3DQO3DQO3DQO3DQO3DQO3DQO3DQO3DQO3DQO3D
QO3DQO3DUO3DUO3DUO3DUO3DUO3DUO3DUO3DUO3DUO3DUO3DUO3DUO3DUO3DUO3DUO3DUO3DSO3D
SO3DSO3DSO3DSO3DSO3DSO3DSO3DSO3DSO3DSO3DSO3DSO3DSO3DSO3DSO3DWO3DWO3DWO3DWO3D
WO3DWO3DWO3DWO3DWO3DWO3DWO3DWO3DWO3DWO3DWO3DWO3DRO3DRO3DRO3DRO3DRO3DRO3DRO3D
RO3DRO3DRO3DRO3DRO3DRO3DRO3DRO3DRO3DVO3DVO3DVO3DVO3DVO3DVO3DVO3DVO3DVO3DVO3D
VO3DVO3DVO3DVO3DVO3DVO3DTO3DTO3DTO3DTO3DTO3DTO3DTO3DTO3DTO3DTO3DTO3DTO3DTO3D
TO3DTO3DTO3DjtqHHbUPO2ofdtQ+7Kh92FH7sKP2YUftw47ahx21DztqH3bUPuyofdhR+7Cj9mFH
7cNc7cNc7cNc7cNc7cNc7cNc7cNc7cNc7cNc7cNc7cNc7cNc7cNc7cNc7cNc7cNc7cOu2oddtQ+7
ah921T7sqn3YVfuwq/ZhV+3DrtqHXbUPu2ofdtU+7Kp92FX7sKv2YVftw0Ltw0Ltw0Ltw0Ltw0Lt
w0Ltw0Ltw0Ltw0Ltw0Ltw0Ltw0Ltw0Ltw0Ltw0Ltw0Ltw57ahz21D3tqH/bUPuypfdhT+7Cn9mFP
7cOe2oc9tQ97ah/21D7sqX3YU/uwp/Zhj/SheQQMfNKHCCR9iEDShwgkfYhA0ocIJH2IQNKHCCR9
iEDShwgkfYhA0ocIJH2IQNKHCCR9iEDShwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/
iEC1D9n+hwhU+5Dtf4hAtQ/Z/ocIVPuQ7X+IQLUP2f6HCFT7kO1/iEC1D9n+hwhU+9Cqfcj2P0Sg
2ods/0MEqn3I9j9EoNqHbP9DALL9DxGo9iHb/xCBah+y/Q8RqPYh2/8QgWofsv0PEaj2Idv/EIFq
H7L9DxGo9iHb/xCBah+y/Q8RqPYh2/8QgWofsv0PEaj2Idv/EIFqH7L9DxGo9iHb/xCBah+y/Q8R
qPYh2/8QgWofsv0PEaj2Idv/EIFqH7L9DxGo9iHb/xCBah+y/Q8RqPYh2/8QgWofsv0PEaj2Idv/
EIFqH7L9DxGo9iHb/xCBah+y/Q8RqPYh2/8QgWofsv0PEaj2Idv/EIFqH7L9DxGo9iHb/xCBah+y
/Q8RqPYh2/8QgWofsv0PEaj2Idv/EIFqH7L9DxGo9iHb/xCBah+y/Q8RqPYh2/8QgWofJmofsv0P
Eaj2Idv/EIFqH7L9DxGo9iHb/xCBah+y/Q8RqPYh2/8QgWofsv0PEaj2Idv/EIBs/0MEqn3I9j9E
oNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/
QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I
9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDa
h2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0ME
qn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/
RKDah2z/QwSqfcj2P0Sg2ods/0MEqn3I9j9EoNqHbP9DBKp9yPY/RKDah2z/QwSqfcj2P0Sg2ods
/0MEqn3I9j9EIOfD129+v8j7n24G2fXNxXD85uZyOP5k/fBNPry6ygbd3VF/8PnNK2pUDxSH4auH
x3z8792xCW0YmvIyU543UehHr7yQe9j1xu3NOBt53qvRcDh+6rpVH9/Ssd78F4Nfb4vb4hsfo5rg
KAiWz7918/Nvy9eLe+X50kqXjBc+//M2MeU/O9/7KTVjg2O99d8tNr3+I9Os/02Mx+vfb9b/ixrr
rf/8j/zyW1f/Guvft4/2f3Fo/Wb9b2KYZrm/6LHe+h+POjff/hhPr//Qd8Hj7//iwA+b9b+JAYEK
1RZgzzscZJ3LwjsvXw1e6/6VsOf1LrPPN14LQxiqbxuouxoIFEe+GDbiAIHiyBfDRhwgUBz5YtiI
AwSKI18MG3GAQHHki2EjDhAojnwxbMQBAsWRL4aNOAAgG3GAQLUP2YgDBKp9yEYcIFDtQzbiAIFq
H7IRBwhU+5CNOECg2odsxAEC1T5kIw4QqPYhG3GAQLUP2YgDBKp9yEYcIFDtQzbiAIFqH1q1D9mI
AwSqfchGHCBQ7UM24gCBah+yEQcAZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcI
VPuQjThAoNqHbMQBAtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThA
oNqHbMQBAtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQB
AtU+ZCMOEKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQBAtU+ZCMO
EKj2IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQBAtU+TNQ+ZCMOEKj2
IRtxgEC1D9mIAwSqfchGHCBQ7UM24gCBah+yEQcIVPuQjThAoNqHbMQBANmIAwSqfchGHCBQ7UM2
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
--0000000000004dc3d7065c31d545--
