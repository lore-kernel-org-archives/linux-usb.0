Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB973C09F3;
	Wed, 26 Aug 2026 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739977; cv=none; b=JBlxETvHBRP4IDKjPDZMLd8yPGMhRkY81PU+ND2k6NMH7/dG1SStOA+iu9onnqkS18Uy2BEkxxdsGbRuIm+nERlZ+QIaMlOqggfvXA3xyTYAg5KErfH3cAHkmOf4D7TbRZ8/4h8LrrOjERd/MMkQvatPp9S0CHNblITjUH3BWHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739977; c=relaxed/simple;
	bh=GWLfSNrirrZzpdNQngtuuosMsyOqXTMlbW5EELaREDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvAasvfEuxwAnxEVsg1tCwAMb50izLJiExJWOArOnfwnrup4yzMpXq7bo/EqV1ePKv3Bw/V3xDFjAy0z0/EowhUdexoYbV7T+kh28V/VO/3Ir2V2npWVhCkCj4Oe7DIoLck/FrtwL7bgosb++4pdUHL5VH9/CPWF5d2PdrfiMes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAiGVgVE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAiGVgVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BD31F000E9;
	Wed, 26 Aug 2026 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787739975;
	bh=ZzPzaQOoXaYEVoYLogItx0viGNTCTJ/8a/CbB8x3kBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fAiGVgVECPqcAhs97DVvyJ6sVWl94Hg/LZgwPbnkAVbHokg/SnVXt3owQSgxwXwLH
	 JcEfrZXMoajK4lt9Gegen1S2L7SlgdF/nSWtUjh6qJ6I8QovCGuCkOlR2310ni2F2g
	 Gs6RSMoetM94NEfuREDb03iyJPMscvUm84mvA7A4qC4XgNC2ConhRJ41hGGPO7dch1
	 M5QaOfuV9SW20ds31Hr8B82LfMwC1BeY2S1blewCN5FrjOgA89gmqTgKmtvoENONqI
	 QLnD7hrK2N9T5KOc8wH9cUUoX8eIe9gINNYo1qRCHG3HLv/uIqVFRKqbUQkLvnFEtN
	 gCyJZDnOoZ+8w==
Message-ID: <733d4be4-2983-4591-9769-e2ccd64191d6@kernel.org>
Date: Wed, 26 Aug 2026 12:26:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>, David Laight <david.laight.linux@gmail.com>,
 Harry Yoo <harry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
 apopple@nvidia.com, byungchul@sk.com, david@kernel.org, gourry@gourry.net,
 joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 matthew.brost@intel.com, rakie.kim@sk.com, syzkaller-bugs@googlegroups.com,
 ying.huang@linux.alibaba.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
 <20260816135201.98590b17b526dda8c4ec9105@linux-foundation.org>
 <20260821093039.04538795@pumpkin> <DKUOVAQ3T03S.14GFWAHY0I6HO@nvidia.com>
 <20260821161310.28255793@pumpkin>
 <BA5425C6-1906-4938-AE75-93719AAFA45D@nvidia.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSNWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBrZXJuZWwub3JnPsLBsAQTAQoAWhYhBKlA1DSZLC6OmRA9UCJPp+fM
 gqZkBQJqFFy6GxSAAAAAAAQADm1hbnUyLDIuNSsxLjEyLDIsMgIbAwUJGtCBUAULCQgHAwUV
 CgkICwUWAgMBAAIeBQIXgAAKCRAiT6fnzIKmZJIUEADFx/tREzUImHrEwVHeSvDFmA7tJysI
 UVrlvrM09E7GIuzphzv7jYmo8n3ANpCczLEVr4G0syYQdTigaZgv3+FQDIIzhKih1IHhu1Ei
 XHlywNWKnQxxQEUNi5Mwx43wQz5XVw9F1A7gtKBKNtfogO511hAbrzagrYajyQacEJ/+sfhZ
 9Da8ltHIXD8pcYaHUfQgEusCgmEd9+KrUwrTbckFKmYq5chuE6yJ4J0EmWknL096jIE6CnzF
 FRslQ3B1UKDjxVsm1ZHfir5NeWszLkTvGFsddFaWTgh8UycESG6VQzKXjjewXu2pG7YQYRpj
 QKm1W5X2TkwWkXRBZTmfmbhxIUMh3+zf5wQ463rSmDN/8v81tdqBtAW6rH/kzg1GvkaTHXn0
 507yEHFzBksk2viAuIxxr7km8+/KARYLIdGtx30EG8cKzAUZOK6WqxtNCsXUJNrVE8CWrCaD
 icoNu7Fs1c5hmPHdSTnU48ce67449DdnO4neLSNhRiGlMHJgfJUmgrxu/hcYeOZ3haWmEQ2w
 uW1Mh01OHi8QZHCEyAbABrPs9GUgccc/4eYXX9hIgxfSkYzn8f+8NuIFPWl/0uTvjgqU29FQ
 SbzOLxHq9439Ox40G5mS5eZXRGxITYR+6TXvRGI6P/264jvflnr/pDGUttaikU+0W+1uxgKH
 cmYbEc7ATQRbGTU1AQgAn0H6UrFiWcovkh6EXVcl+SeqyO6JHOPm+e9Wu0Vw+VIUvXZVUVVQ
 La1PQDUi6j00ChlcR66g9/V0sPIcSutacPKfdKYOBvzd4rlhL8rfrdEsQw5ApZxrA8kYZVMh
 FmBRKAa6wos25moTlMKpCWzTH84+WO5+ziCTsTUZASAToz3RdunTD+vQcHj0GqNTPAHK63sf
 bAB2I0BslZkXkY1RLb/YhuA6E7JyEd2pilZOrIuBGl/5q2qSakgnAVFWFBR/DO27JuAksYnq
 +aH8vI0xGvwn75KqSk4UzAkDzWSmO4ZHuahKtQgZNsMYV+PGayRBX9b9zbldzopoLBdqHc4n
 jQARAQABwsF8BBgBCgAmAhsMFiEEqUDUNJksLo6ZED1QIk+n58yCpmQFAmfIHFQFCRYU6J8A
 CgkQIk+n58yCpmS2PA//bqN1LfcotmArgElsa+0EGZSQlYgK48pm8WAeTXTngudP9IJ4SuKY
 HR5RNjHcBeqN+Me0zxRqYzRb8nGanHEkDyf4Im8DQM8d6vbyU+FcPmG4skud4kgS1zMHnlVd
 SXfSIwKC/hKgdHG8aBV7545Lz9X6Iohea+94wneD0aw/hqF+QWewGZhWJriWAZtvEkzNjQOi
 4U9F/trLten/x7bpphDSnDMKJtITbtzATT1Dq7o7VpIUK1nCTQALMuMjKCdi8OdU/+V+R3O4
 0PXWvX8qrvqYapVbZ+9KqT74FsuB0Ya9uXwgBF2Q6cRuETZk5vqaqKxzqoQZCO8AOz/58j6O
 2RHNy/mZEN+7tJ5Tsq42zVJ4jxsT8b9YplavCMsnBgDeRWhcbYhCyttoL7nYISyWg4kQYZ/P
 wIV3OuNv2f8iKYsxNsRuClOAF82+gvqOy1/1pprFjy8uo2pkoOrb63aOP3vO5VHnRKgra6dq
 NcaZ+c6J4H+nEJGi2SkHAUJz5oBzuThvPudLvPA/SK8sKoM01IRxSihev/S/5WLazXB1PGem
 OCbvzC1IjWJJraxiDJ5IygokapUa2RP7+WBR22skQ3SSl6G107QgWKSyTOGWEaRmV53vxQLV
 jXuCmzSSasTL60zq5yGrT4/DYQVSNEUiUbG4pYekxJujNeEDkUlky0Y=
In-Reply-To: <BA5425C6-1906-4938-AE75-93719AAFA45D@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/26 17:31, Zi Yan wrote:
> On 21 Aug 2026, at 11:13, David Laight wrote:
> 
>> On Fri, 21 Aug 2026 10:24:36 -0400
>> "Zi Yan" <ziy@nvidia.com> wrote:
>>
>>> On Fri Aug 21, 2026 at 4:30 AM EDT, David Laight wrote:
>>>> On Sun, 16 Aug 2026 13:52:01 -0700
>>>> Andrew Morton <akpm@linux-foundation.org> wrote:
>>>>
>>>>> On Sun, 16 Aug 2026 12:25:48 -0700 syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com> wrote:
>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> syzbot found the following issue on:
>>>>>>
>>>>>> HEAD commit:    3d6d817622b0 Merge tag 'scsi-fixes' of git://git.kernel.or..
>>>>>> git tree:       upstream
>>>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=15927479580000
>>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=a59830cba91a1981
>>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=805630f1453e490427fa
>>>>>> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
>>>>>>
>>>>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>>>>
>>>>>> Downloadable assets:
>>>>>> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3d6d8176.raw.xz
>>>>>> vmlinux: https://storage.googleapis.com/syzbot-assets/d19e0514c02a/vmlinux-3d6d8176.xz
>>>>>> kernel image: https://storage.googleapis.com/syzbot-assets/f6da706811f4/bzImage-3d6d8176.xz
>>>>>>
>>>>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>>>>> Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
>>>>>>
>>>>>> gadgetfs: bound to dummy_udc driver
>>>>>> ------------[ cut here ]------------
>>>>>> 1
>>>>>> WARNING: mm/page_alloc.c:5280 at __alloc_frozen_pages_noprof+0x2ce/0x380 mm/page_alloc.c:5280, CPU#0: syz.0.0/5319
>>>>>
>>>>> Thanks.  drivers/usb/gadget is the offender.
>>>>>
>>>>> Gemini sums it up well.  "ep_write_iter() needs a bounds check prior to
>>>>> memory allocation".  https://share.gemini.google/5NzjyttO0ULc
>>>>>
>>>>> I expect an easy fix would be
>>>>>
>>>>> --- a/drivers/usb/gadget/legacy/inode.c~a
>>>>> +++ a/drivers/usb/gadget/legacy/inode.c
>>>>> @@ -666,7 +666,7 @@ ep_write_iter(struct kiocb *iocb, struct
>>>>>  		return -EBADMSG;
>>>>>  	}
>>>>>
>>>>> -	buf = kmalloc(len, GFP_KERNEL);
>>>>> +	buf = kmalloc(len, GFP_KERNEL|__GFP_NOWARN);
>>>>>  	if (unlikely(!buf)) {
>>>>>  		mutex_unlock(&epdata->lock);
>>>>>  		return -ENOMEM;
>>>>>
>>>>> or do what Gemini said.  Me, I'll add some cc's and run away.
>>>>
>>>> Should there be a separate flags for 'request too large' and
>>>> 'no memory available' ?
>>>
>>> What flags? Are you suggesting kmalloc should return an ERR_PTR to
>>> distinguish different error types?
>>
>> That would break to much...
> 
> +Vlastimil and Harry on this. Maybe worth giving it a try.

We would have to change every existing caller to check for ERR_PTR instead
of just NULL check? Not worth it IMHO.

>> I was thinking of a GFP_NOWARN_TOOBIG.
>>
>> That isn't enough to change the errno though.
>> But a smaller sanity limit may make sense anyway.
> 
> Maybe. I am not sure if we want to spend a GFP flag for that.

Agreed, those are scarce and this is not worth it either.

Maybe a wrapper for kmalloc() for "allocations with potentially untrusted
unsanitized size" could be made (we can always increase the existing wrapper
hell...).

> Best Regards,
> Yan, Zi

