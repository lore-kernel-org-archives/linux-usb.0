Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0354F318EE7
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 05:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790400911; cv=none; b=GClc5DKwvRwRUi0o2qBmB3GTBA+NG2V65IlEtVcGLNqtBQGhOLndcPF2glpS6qQMMfEJiLVvmN3ah2OY7vNuRC1IYFE10lW/aw4cn20woMgwRGo5iHpflokERE+G4oIgtAgDK6yuyPVY5ILC2mysY7x4PW2kdgNGSv1bBJs5AGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790400911; c=relaxed/simple;
	bh=jqVfDelRCatz8IoZuMGXl24mQwGuacef7xYu9wrEt2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0gyIaUyytL/dhuF5VvrzhcQDSvnyAlVbeyy44g7s5bmLBtg66MVEKsOJdpDcSND4mnSqnbYmYpum81UFfe4fBwAH9BQPEyqqygaVv74XudqfA5hl+sw67DKu93niqsSrlvpDzkAMeZ5/lBhL7w7/0BaT6QxTHx362P8VFdx0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhiyLyGS; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhiyLyGS"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-343479e6005so53158eec.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 22:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790400909; x=1791005709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZgS6ZoQB//wv4pNMtltkoO1b4JMLAheYxOJXzMb228I=;
        b=RhiyLyGSKD2dE17gzGnvIz+33KrWtj32H/+u+fCze2Z2rhSxJMdRDGsTvoxUmDijbR
         ZEHeDTKzRQInFvxbaZ4Pzhtry1lAQ3cHY+BkIkGbSKQyrPNFvw6GciCFsvcmRDOI4DnS
         SQCAbhUTZNfsQe7fx/8pgDKKcn4KaFQREq5Aftm2pN0ekdco5fQlapahlK9INDJV9Vok
         80vSSFDJNjC31AzFrGwMjuiiX/Cgk29xnqo+Ig5A3AFJebWMaN7iR3znqqf3T5QNWPYi
         vqVqGyV/qhrW1mgxpsf/K3XHVTa7GOxKbjQMkwMK7UPdeO9NOP/DPdlhK94RE24wHarQ
         BXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790400909; x=1791005709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgS6ZoQB//wv4pNMtltkoO1b4JMLAheYxOJXzMb228I=;
        b=Tvb+0uVUYY8T8/mSWQwm72VMLi3A1UhAosDg44s8KRKUOgDhg8DEObgy/JXb50DDth
         DvnGmmXDIQft2e0B7oKdvHZ7u/A8+dJT8Y8AMao47GGPKPEGi1m3UjQCCdSSrSkSRlzo
         efBUSr+mxzPZ5xSPVb9o6wPDpWEieaJideRxXdNtNfKtWAToKdCVrPOl0vasy28vE+U3
         7U53D1Ldhxr3WO8XW8zbrdwvhcLXXtr+w3eQ08ShkZCyrYA2UsH51/uWBZM0j4VU9kY9
         RQdtvVezo1NK1Ux6lh7h5naPwk1R2yCqTwhXspcDrRXFeHrLJE9zqj/BtHcunwibrB+i
         XVvw==
X-Gm-Message-State: AFuF++l1P0vdqxCXMTa82RlprCt9f4vkKzMP1es3J+SQnblfKUoj8Mh2
	RImdSN2fDvBm/qogi4VLiDSIW3RwnX7yuDWtLm60OOfJ4J0HFwzVi0vHZq39/w==
X-Gm-Gg: AYBFou06JDeLHdvcQcf0PRphmKSFlDJ5uiDSzeHnQMYMXWNWTmHZC26nMACQBpvLfGj
	96HrfoZQAwUMn4D50uDMRYtQbAI0mTbxXeziOAeWW3VWL6WcG7wkb2xnrJ+61tZcP2U2wooxO6i
	ED1Vos0l3BKWFLJRlDTfEDQbzAAMmfViumLjDOFcreOTYi4stZVlMqRkyGv8jk+JNIQJrJG7u8h
	9sPPj5uRCJO0PBvU6x/nH2H+udyJgm74WVcUo/iWvKWYQIxinPVKOZB7cpzFwGFV8o/tOnyebp9
	t7FbsmGISTrjp5tw+TYJr7j8jD4LA3YN6wfZbA41cBteZi7aGlxNNC+02OC+aMXKDJxR48i5wYX
	r3Q4FuXKisqg4Xpx1UEnfl5Va7WZlisV/vxlqdXeTzi9FpQnrRzoMdYr7D1ECkzeMC+LTZbBBs0
	tIqido6hvC0ASnNtWtZxkNlRPY4qV5Nh0MN6w5EQLxZRoPLI6oERtZe8TPp9e8T0Gc5cv0ZVJPN
	0DkELM2jMHnqyouMaosq7NRLTzTJwUOMmQOPV6plRI9IU0DNHj/1l+VjOs2CqjoOqhVe9BF+2n+
	03k=
X-Received: by 2002:a05:7301:5412:b0:333:75a5:10d8 with SMTP id 5a478bee46e88-34273e309ddmr1956205eec.27.1790400908838;
        Fri, 25 Sep 2026 22:35:08 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:8b08:15c4:66f2:a984])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3433628f5basm1648812eec.18.2026.09.25.22.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:35:08 -0700 (PDT)
Date: Sat, 26 Sep 2026 11:05:05 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: BurningHoryd <sjunhyuk1@gmail.com>
Cc: linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [BUG] HP OMEN Transcend 14 (board 8E41): GPU power ceiling on
 65W USB-C charger is non-deterministic
Message-ID: <ardXy3mJuZg7trP2@archlinux>
References: <20260922192312.40607-1-sjunhyuk1@gmail.com>
 <20260922213218.5334-1-sjunhyuk1@gmail.com>
 <arVGfB1PV7kt2Llq@archlinux>
 <20260925134148.435774-1-sjunhyuk1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260925134148.435774-1-sjunhyuk1@gmail.com>

On Fri, Sep 25, 2026 at 09:41:48AM -0400, BurningHoryd wrote:
>Krishna,
>
>Thanks for taking a look. The acpidump is already up -- BIOS is still
>F.05 (same as when I captured it on 8E41), so a fresh dump would be
>byte-identical to what I already have; no need to redo it.
>
>Full acpidump + decompiled SSDT23 (the table with the NPCF device) is
>attached to my earlier comment on the NVIDIA issue:
>
>  https://github.com/NVIDIA/open-gpu-kernel-modules/issues/1162#issuecomment-5779711336
>
>Same topology as board 8D40 from that issue: NPCF sits under \_SB as a
>peer of the GPU rather than as its PCIe child, which is why the open
>kernel module's NPCF binding misses it and Power Management Object
>stays N/A. That explains why >50W Dynamic Boost never works here, but
>it's a separate mechanism from the 25W/65W split on the 65W charger --
>PMO is N/A in both states, so it can't be what's flipping that.
>
>Happy to attach the raw acpidump/ssdt23-acpi.zip directly to this
>thread instead of linking out, if that's easier for you to work with
>-- just say the word.

Thanks but I can only find SSDT23, I wanted to take a look at the HP WMI
side too. Is it possible for you to attach the full acpidump instead?

>Thanks for flagging the missing Signed-off-by on the other 8E41 patch
>too.
