Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396941;
	b=mVMGMoSJNdz3SfgoI3ECQ8xK2dc4TuGzwudqT9hw09V9iYwgS/RVYt6Y65Icfum+rIFp
	 fmoPoUSrvLLQtNzpiAb5h3nSBNcJEtVPRV9N59yg8Jr42B49jOZBTF7abWrTf0yKLUJ/G
	 7cJKToxhfZjjbhQeplEplzOkmPMwUVmRtc3IAezwQVOJXAcoUxMKwboru2vx4lBoTy5N3
	 X2h06GVoMihxjDNem3+h0+4+ihDJtTUNcnC4SHStxOIgBxEMQp/UNbi7VpHeHtCnEkuop
	 hwjRMkkd9RGLzIIbKPmQCWzeltZVAG9iASrbDPz2EDjSEB+B4rirTX4NByS4zReByew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2Q8qQWgKcP+xT57roRgQ8IJ3xXja0pQGrqCS2TbAAfE=;
	b=3c6D/SVTYOq2UzfZs4XI+ywFue35ui6tkZBfVpmXI2FDIbHX208jzIl7Ap3KMkTyCPdy
	 oSEx9P4m2i9KQqPeFBZBNbPergERURjRYMTxUuAjfPU/4+6aZOsYnCj5Uz+QioKXn0Sip
	 /Z+teVwoYcf4F1qLK6SQ14KGsOT1Y3i8SGQyKqbQ0zc1Jc1SffokwwcNbVNjgmyE9qJhz
	 4Wyv4iv1sr5oFe8ofKj1iDnq2V8vqSv+65cuS7PHJe8pDCf2n6c5EQpltMx6WUc++AQwD
	 ByhJXZRw62Ydz/OI1bQ4tIImVCTKIUrW/wVEy+No9NXeU7tBnsZJmNZxoPzprovl19A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcnD80S6;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE77606A32E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 01:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE77606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcnD80S6
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3305575c88.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 17:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396940; x=1796001740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Q8qQWgKcP+xT57roRgQ8IJ3xXja0pQGrqCS2TbAAfE=;
        b=rcnD80S6RHlSfFU8FCgfOc0ABV95p4Il5Ah/CGuObNMNDoi/6q+Szy1oe0iVWlIMoL
         Y/Rbloz1sA1ibz7cbUzYlxer4QwSEaU/Tbdzzq5M+1S/1I5jDzcyw3hmxyTqXJ306W61
         L048QyV6ekg3eBAbQ6i322m6qMqFIgtFb9Qlw4oVGC/FL8BeAWtG49fyAdFRvDWVeRJd
         uuaPN6YzRDDZ4+wOBgkh1W9gZYI4AtnucAMEh1TM+QZKabFMnJk94bTuPsfrN27Vp+rV
         KVC5KxLp2ILW4CluX3r5RTzj9fukwcR9HaTsu6ACUYQZENPCfO3iRFAo/38PeXP6GU3B
         HLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396940; x=1796001740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Q8qQWgKcP+xT57roRgQ8IJ3xXja0pQGrqCS2TbAAfE=;
        b=AXXpMG4d4nq3jEihjo+WD/x6+GkX8QQSWXd3L7d9ptSFGUaGpV6lTFdPy7KSGo0bHP
         zylpLghhsa7+/Www87VgMKzpTIXCcdXd9Ff89lZ1J51XoeRV3Z7Cq6U3Q9QlEIkcAyU0
         T7BD0EhPMo/fffzd87GOaS1dSdsZ4zP7xwefb+ZQ1h8PuPtFqQkdWEu8uhtHhE1Gxdcv
         /IT6CjY2XHaHZQ6jhmYIHP62KkT6r58KLkCk031J2c7HywqSyKbxc+b8em+am6bvA5m5
         aAZxAdVyA9vay4pR5KftM/4ihpS41APzcV3SadwBDhPYK7VL+9toWeRy+d+VSWR6drYK
         JJxQ==
X-Forwarded-Encrypted: i=1; AL+hErHw4Hem/pOsS5udu8Q7JFakYsrP4YsxU3LlTTeMaalE7PU5bbfUyp18IFWys/MfoVt6ohsYL/vX/8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WtMRb38YjhyvNykLWELMh86uLge3ZoTOsgT7XnHoQU9hHR05q
	di1aM2n6uWgOlthwWI7O2dSdkvVtZwvtx6e1S29eBh9PN0vYbhGr54aG
X-Gm-Gg: AZFdTZeKWUOfcybpLF2Oe7i58jCKvNtickrMiMr5hJksH9Hse/KDxiuelo0ed6/o6FW
	5k99DCPwzNLoovyJgjmpl1MPK+ZcveZc1n+pxRjCKWHIZtmOQx937YcfWBsWCbCiSwWeaWqMIZr
	+zulIb9AhH+YWKSH+DSGFsNSYCKcQwY7Ki/H7RvZE7D61XXe+V6aTnTXhgeRMbQjqdB5Wimtw5X
	C+5rv3AoiymQCEVuYydrXBaGO2gVNW0EGmk6T6YqofFdg76DlGjbx+DeKEWgEA23HSt4HI+kklm
	LAcDtgqKsgFajyvzkzxpzGK5jhONr6sdjDJ0eI7MEZNGPkbRzto5MLdel3oMRRxHs51uMNxYxWb
	jaOrhlsuhswo1Nhi8Qg1pE94s2cq0bkyfkfF7F9aUjNWeZje285tOv0wq5n7udmvHUt2B0Glf+B
	ey4LjxGV3JNyleiuI4m85MwXYE3Le/qhLXWjdrZnFXwF0M8hCm+L6VZadvh7ULYVkJLpTRpn1gw
	MrfuxUXjp+URZTZMdNYo7x7UAR/L0R5Q+YTckDCP5cQ1zMymyDHvnSzJvYdz74xwzxiOwxZExnM
	K7fSK0ZEq+7cXpVBmScfVyG171dzfhkPnEpBvesoEjZ81u4/zh7ev5h+NZBLtKjSnSI8tmI=
X-Received: by 2002:a05:701a:ccca:20b0:1b5:71bb:6800 with SMTP id a92af1059eb24-1b571bb698bmr1863335c88.3.1795396940552;
        Sun, 22 Nov 2026 17:22:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm22955681c88.2.2026.11.22.17.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:22:19 -0800 (PST)
Date: Sun, 22 Nov 2026 17:22:16 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Alfred E . Heggestad" <aeh@db.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, 
	Thomas Reitmayr <treitmayr@devbase.at>, Shaun Jackman <sjackman@gmail.com>, 
	Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, Florian Euchner <florian.euchner@gmail.com>, 
	Johan Hovold <johan@kernel.org>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Xue Lei <Xue.Lei@windriver.com>, linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: remove obsolete cm109 USB phone driver
Message-ID: <awOVNaQM8_Hb5E3H@google.com>
References: <20261112001642.243554-1-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112001642.243554-1-dmitry.torokhov@gmail.com>

On Wed, Nov 11, 2026 at 04:16:40PM -0800, Dmitry Torokhov wrote:
> This short series removes the obsolete cm109 driver for mid-2000s USB
> VoIP/Skype handsets based on the C-Media CM109 USB audio and HID
> controller (0x0d8c:0x000e) and drops its module selection from
> ppc6xx_defconfig.
> 
> The driver was written in 2007-2008 (modeled after yealink) to poll a
> 4x4 phone keypad matrix and toggle a buzzer wired to the chip's GPIO
> pins across four phone models (Komunikate KIP1000, Genius G-talk,
> Allied-Telesis Corega USBPH01, and ATCom AU-100), relying on a module
> parameter (phone=...) to choose the keymap. The mid-2000s userspace
> VoIP/Skype bridge ecosystem for these handsets is long defunct, and the
> driver has seen no new hardware support since 2008 while continuing to
> attract syzbot crashes in its custom URB state machine.
> 
> Furthermore, because 0x0d8c:0x000e is the generic default C-Media CM109
> VID:PID and was added to hid_ignore_list[] so cm109 could claim the USB
> interface, cm109 actively interferes with non-phone CM109 devices still
> in use today: amateur radio interfaces (Direwolf, AllStarLink, SVXLink,
> UniPager, Hamlib) have to blacklist cm109 so usbhid can expose
> /dev/hidraw* and so opening the input device does not pulse the GPIO
> pins and key the radio transmitter's PTT line, while standard USB
> headsets with 0x0d8c:0x000e can bind to usbhid directly via the chip's
> standard HID Consumer Page volume and mute descriptors once the
> hid_ignore_list[] entry is dropped.
> 
> Thanks.
> 
> Dmitry Torokhov (2):
>   powerpc/configs: drop CONFIG_INPUT_CM109 from ppc6xx_defconfig
>   Input: cm109 - remove driver

Applied the lot.

-- 
Dmitry
