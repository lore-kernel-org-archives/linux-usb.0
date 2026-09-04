Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AE04F4747
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535685; cv=pass; b=tTzmmP5YoPW++EYEhy+Go4DnFynp/fTCNv+SE5HPfxOUto0ZuuwhwO8+wSSG2lf5Z06EtZ6L2tuDq1Knw8rKcp9lIGaz0IleEn9cCWTUpQq1M+OsXnlHO5mr3b+Ox3MxI8y81ER0pZMdlNUUD0A0HQgoqqYI6jsc1GMmValnpug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535685; c=relaxed/simple;
	bh=h1ey2JVwd5mm5rG3ewHFS9R1b94cuUw/eArpKxkqrac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gAdh3WhJDPUhEMlYG8YB4dx0eMAQ9n9rCWPn/Z/GVVsmgp4GVT3Uzk8CNp7NqF1P2HKFFZFn9vKWxz1LGDSKK3Lr7JiUCXGTAu1TAJPpPSOq0hDz8+7Oq6KuYZ4I0SriXhOTMUVaDue9J8bK9hKvAJSdg+WViigvSEU3dNkUnDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZLoKssk; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZLoKssk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843e397f74so1404928f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 08:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788535681; cv=none;
        d=google.com; s=arc-20260327;
        b=eR+LpwBjhPygnIKv3C4eiZsQZDeEKKKNzclZRwm16r/VTXxU0pdFPj2OxXgaUcorh5
         9TzB1JXL75fB/Fi21iJoA9mTh+A5cNJMTMx8N9Dfbr8xvWb8iUxNyS7zPS3aLrvRxulc
         OHLd1Rc0q2/ylK5u48ZUQgfPTOsFZsAvUdol3sT24ptXrw4Bax6s3A0FtLJAzJS6KF20
         Le6+9DSdAi71fDGYNsTMG8/eB6PY2+nfVt+RSwbdLh2iyjnjj/lcJvemPo39Wwv8KriV
         E992/SKtD0XTUVtgPkDG6/vN9Y4bVcrLm64Tm8WfgkqLtsEaLmJWj4QYFZFY+RO8ENnh
         UQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T29lJmwD9dBzAR+wek9mxqJ9K3zRLSsXJc1YzE+hbpM=;
        fh=FZvrb+RTW9RGZ2WEL29gHq3LQMICxqtdCxagAvIdpIE=;
        b=fY3MwTcyX4NfffAM2aC6EnkxR/R6na37EUx98yNkrIHJdTHIZGN6KUGU1cQoTaJjz0
         el9LgIfXtAiTyYs6ZGb310rAzUJWTpolm34Mdc/cDxBvytBQcP8e+K+JUeEdUsyMN6kX
         4nOtzN2lseGNzra5p7Cg/EhWvdj0vofDdbCp/i0fG6ufu0FlJHFG7LGb2cRqKcH6TypT
         lgcGtn+iBsKPcoWrz/xta1zHRY4Vl/c8AnkeUagtm9vpg7G4NyR77pOaGYTDuOTaUB6e
         g4mb7/FxwLDc2kIEsnwuAlBa27wvI3780KxCeKZox3dyRee7j52rlzvIJKOLQouR3Lpj
         U5gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535681; x=1789140481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T29lJmwD9dBzAR+wek9mxqJ9K3zRLSsXJc1YzE+hbpM=;
        b=XZLoKsskvRdYE4+g+BLmwJmCqY0qZoo5GoHHw4xuE1gZ3+/5INkrGsgGE6uBFGe3yr
         XEeRRkqehTq+GBiqCE+nKq95OcTDP6j9/2eJE7jM+w8Btv1bFtCAQ1UIVhA5+5OFa71C
         jxSRAEmrzM2vXimr2Hfs7QED4L0rdqrai9NnVhMI3SOg8QVayrPBDYu3KR9XN2RTJ//T
         KP1xzvtGHepzyTaKWMzskf6dF1iv5/WeaqH+6D4GSK5GX677qbP3HNiw5NLZf0YukSYi
         t7FjCr2nc0qcdrFh5Akg+JJfCgnGL3B7feqQq0e4NhfBxLu/AvK0S9Nz4A3OXrHweSjT
         WE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535681; x=1789140481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T29lJmwD9dBzAR+wek9mxqJ9K3zRLSsXJc1YzE+hbpM=;
        b=VCPpGq315cLzATE4t3PEU9P4pZpOU7kozOORuCwziwZ1aKJ1SEQaJQ5yoJK5I53epE
         2fb3CXBgC3m3SsP5x3kRYLfNeYzaLuLwEZWPZMPaN51Zr0seOrWr2NtCh2f9ZFnEHFbX
         Gkcu3PGsU0JdN6/vtPY6HwX3ByJ1pYF8c1X+AeS4ZjIXAwQa7M/G9hJH0ddTDcz03OX9
         w8fYcVxVUH2gXeAC949lFN6NQWOzwATi/lKcxLSA7Qwcktfj5A/MB2LcVy6k5WNDQyYJ
         uXYgg4EZBFNAO+VasMplWUy8NBIPdrraksZ9Wj3spbW6fzdewdDfqbdXcN5xWQqJs7cO
         tdaQ==
X-Gm-Message-State: AFuF++lkSUm6v/ih1sJRUXriQxH1JHH9OZ9jHFEr9qe7lUBPwTOS4mv4
	XLDyk9Z4V986IfwpamJ+XAWnht6MnsfJFlmJGRVPCswihelmWlUjfU3VoqxvgC/COpmnymW90iJ
	tr6U5hTe/tfOppsGmcIfrwZ51uQCVJbFe6i+qWlA=
X-Gm-Gg: AYBFou3dA53TpJDkpBrEQieRDpPVFgPLnNI3CFCF7MY1sxebPioLGPQhSW6dgP+v0qk
	5Sd20ZlsapwuTXv+fKRPjrElDgvG8Ah5eP9GY7SEbGmEyXcbBcs1WTyiOR6pA3/7XSLoqkWW90r
	TdGZqcEoIobqnrhEsPOBJMonbP3ssdNhdnbihaS98NG/fswfDOlIPGrYhIrMQqQ9OSxRI9Pklst
	HCfDdYlCmXi+r4ylVrDnk0YgzC7gDqtSWJNTBS6Mx8Qs32I2dxso6KbFo/x0S40HzQcMnfnStHr
	8PSNZA/CSFquEMN7I/pB6GGQbI/M7UC6opAtat4ZKwtnA9Q=
X-Received: by 2002:a05:6000:460f:b0:485:8226:c69e with SMTP id
 ffacd0b85a97d-4858226c95cmr13165093f8f.29.1788535680814; Fri, 04 Sep 2026
 08:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAF4-o1c6XLbJr5umK+FRmMetcRkxH5JnRjMUpWw7OpnkUWbvVQ@mail.gmail.com>
 <2026090452-appetizer-pacifist-57e5@gregkh>
In-Reply-To: <2026090452-appetizer-pacifist-57e5@gregkh>
From: Syed Labeeq Sajid Bukhari <syedlabeeq@gmail.com>
Date: Fri, 4 Sep 2026 20:27:46 +0500
X-Gm-Features: AcwNN1Vsd2BdBTotixMKVes7objjhc-bItxBHrowmHApF-_5BWT3GVZM3mFc-qY
Message-ID: <CAF4-o1fTYbxEb95NVsvcJ7=jdJB+vXpzspqcgwhNn=+FBsOsNg@mail.gmail.com>
Subject: Re: [PATCH] usb: storage: sierra_ms: reject short SWoC info transfers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, 
	stern@rowland.harvard.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thanks for the quick look, and apologies for the corrupted patch -- I sent
sent it via a web mail client, which messed up with the whitespaces. I will
resend it properly with git send-email, with the patch also attached.

On the short-transfer concern:

The SWoC query explicitly asks the device for exactly
sizeof(struct swoc_info) (wLength =3D 60). This vendor command has a
fixed-size response, and the driver already implicitly assumes a full
answer today: containsFullLinuxPackage() and truinst_show()
unconditionally read fields at fixed offsets (bytes 9-12) that a short
transfer would never have written. So with a short answer the current code
already makes its mode-switch decision on uninitialized garbage. The
patch only makes that failure explicit instead of silent.

Two further points:

* sierra_ms_init() retries the query up to 3 times on failure, so a
  transient short transfer during probe is tolerated, not fatal.

* There is core precedent: usb_control_msg_recv() in usb/core/message.c
  rejects short transfers with -EREMOTEIO, i.e. the USB core itself
  treats a short control-IN as an error.

To answer the testing question directly and honestly: no, I do not have
the physical hardware, so this was not tested against a real Sierra
TRU-Install device. It was tested with a fully controllable emulated
device (raw_gadget on dummy_hcd, VID 0x1199 PID 0x0fff) against a
self-built 6.12.108 kernel:

* full 60-byte response: enumeration and truinst reads behave exactly as
  before (attribute created, values printed);
* short response: the query now fails with -EIO instead of exposing
  uninitialized heap through the world-readable truinst attribute.

If you would rather avoid any risk on some devices you mentioned, I
can respin this the other way: allocate the swoc_info buffer with
kzalloc() in truinst_show()/sierra_ms_init() instead of rejecting short
transfers. That closes the uninitialized-data exposure without changing
behavior for short answers (the unwritten tail becomes deterministic
zeros). Happy to send whichever variant you prefer.

thanks,
syed labeeq

On Fri, Sep 4, 2026 at 8:09=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Sep 04, 2026 at 07:52:59PM +0500, Syed Labeeq Sajid Bukhari wrote=
:
> > sierra_get_swoc_info() requests sizeof(struct swoc_info) (60) bytes
> > from the device via usb_control_msg(), but its callers only treat a
> > negative return value as failure. A device that answers the
> > vendor-specific GetSwocInfo request with a short IN transfer is
> > therefore accepted, leaving the tail of the freshly allocated
> > (kmalloc(), non-zeroing) swoc_info buffer uninitialized.
> >
> > truinst_show() subsequently prints swocInfo->rev, swocInfo->LinuxSKU
> > and swocInfo->LinuxVer from that buffer into the world-readable
> > (0444) "truinst" sysfs attribute. An emulated/malicious USB device
> > (VID 0x1199, PID 0x0fff) can exploit this to disclose up to 5 bytes
> > of stale kernel heap memory (kmalloc-64) to unprivileged userspace,
> > once per sysfs read, indefinitely. On kernels built without
> > init_on_alloc this leaks recently freed heap contents.
> >
> > Only accept the transfer when the full structure was received.
> > sierra_ms_init() already retries failed queries, so well-behaved
> > devices are unaffected.
> >
> > Fixes: 32fe5e393455 ("USB Storage Sierra: TRU-Install feature update")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Syed Labeeq <syedlabeeq@gmail.com>
>
> Did you forget an Assisted-by: tag?
>
>
> > ---
> >  drivers/usb/storage/sierra_ms.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/usb/storage/sierra_ms.c b/drivers/usb/storage/sier=
ra_ms.c
> > index 177fa6cd143ab2837640c26f8336781ddd3cf9cb..8755fda42eed2afd3235283=
e990a35aac14cb829
> > 100644
> > --- a/drivers/usb/storage/sierra_ms.c
> > +++ b/drivers/usb/storage/sierra_ms.c
> > @@ -76,6 +76,12 @@
> >   (void *) swocInfo, /* void *data        */
> >   sizeof(struct swoc_info), /* __u16 size     */
> >   USB_CTRL_SET_TIMEOUT); /* int timeout     */
> > + /*
> > + * A short IN transfer leaves the tail of swocInfo uninitialized;
> > + * only a full transfer is valid.
> > + */
> > + if (result !=3D sizeof(struct swoc_info))
> > + return -EIO;
>
> This is corrupted and can not be applied :(
>
> Also, are you sure the device will not send "short" data?  We've had
> bugs in the past where we have added this type of check and it turned
> out that it broke valid devices, so be careful.
>
> Was this tested with a real device?
>
> thanks,
>
> greg k-h
